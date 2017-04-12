import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

import java.io.*;
import javax.json.JsonValue;

public class MiniCompiler
{
   public static void main(String[] args) throws IOException
   {
      parseParameters(args);

      CommonTokenStream tokens = new CommonTokenStream(createLexer());
      MiniParser parser = new MiniParser(tokens);
      parser.addErrorListener(ErrorListener.instance);
      ParseTree tree = parser.program();

      if (parser.getNumberOfSyntaxErrors() == 0)
      {
         /*
            This visitor will create a JSON representation of the AST.
            This is primarily intended to allow use of languages other
            than Java.  The parser can thusly be used to generate JSON
            and the next phase of the compiler can read the JSON to build
            a language-specific AST representation.
         */
         MiniToJsonVisitor jsonVisitor = new MiniToJsonVisitor();
         JsonValue json = jsonVisitor.visit(tree);
         PrintWriter outfile = null;
         try {
             outfile = new PrintWriter(_inputFile + ".json");
             outfile.write(json.toString());
         } catch (Exception exc) {
             System.err.println("Could not write to file '" + _inputFile + ".json'");
             System.exit(-1);
         } finally {
             if (outfile != null) {
                 outfile.close();
             }
         }

         /*
            This visitor will build an object representation of the AST
            in Java using the provided classes.
         */
//         MiniToAstProgramVisitor programVisitor =
//            new MiniToAstProgramVisitor();
//         ast.Program program = programVisitor.visit(tree);
      }
   }

   private static String _inputFile = null;

   private static void parseParameters(String [] args)
   {
      for (int i = 0; i < args.length; i++)
      {
         if (args[i].charAt(0) == '-')
         {
            System.err.println("unexpected option: " + args[i]);
            System.exit(1);
         }
         else if (_inputFile != null)
         {
            System.err.println("too many files specified");
            System.exit(1);
         }
         else
         {
            _inputFile = args[i];
         }
      }
   }

   private static void error(String msg)
   {
      System.err.println(msg);
      System.exit(1);
   }

   private static MiniLexer createLexer()
   {
      try
      {
         ANTLRInputStream input;
         if (_inputFile == null)
         {
            input = new ANTLRInputStream(System.in);
         }
         else
         {
            input = new ANTLRInputStream(
               new BufferedInputStream(new FileInputStream(_inputFile)));
         }
         return new MiniLexer(input);
      }
      catch (java.io.IOException e)
      {
         System.err.println("file not found: " + _inputFile);
         System.exit(1);
         return null;
      }
   }

   public static class ErrorListener extends BaseErrorListener
   {
      public static ErrorListener instance = new ErrorListener();

      @Override
      public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line, int charPositionInLine, String msg, RecognitionException e) {
         System.exit(1);
      }
   }
}
