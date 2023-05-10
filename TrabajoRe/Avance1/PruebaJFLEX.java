import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.HashMap;
public class PruebaJFLEX {
    public static void main(String[] args) {
        try{
       
        // Asignación del nombre de archivo por defecto que usará la aplicación
        String archivo = "prueba.txt";
        String Result = "TablaDeSimbolos.txt";
        String Tabla = "Tokens.txt";
        //Imprimir en archivo de texto
       
       
        // Se trata de leer el archivo y analizarlo en la clase que se ha creado con JFlex
        BufferedReader buffer = new BufferedReader(new FileReader(archivo));
        AnalizadorLexico analizadorJFlex = new AnalizadorLexico(buffer);
              

        BufferedWriter buff = new BufferedWriter(new FileWriter(Result));
        BufferedWriter buffSa = new BufferedWriter(new FileWriter(Tabla));

        HashMap<String,Integer> direcciones = new HashMap<String,Integer>();
        int contvalores = 0;
        while(true){
       
        // Obtener el token analizado y mostrar su información
        
        Token p = analizadorJFlex.yylex();
        
        if (!analizadorJFlex.existenTokens())
         break;
        
         if(p.getToken().equals("Variables")|p.getToken().equals("Numero")){
          if(direcciones.containsKey(p.getLexema())){

            int IDLex = direcciones.get(p.getLexema());
            System.out.println(p.getToken()+ " "+ IDLex);
            buffSa.write(p.getToken()+ " "+ IDLex);
            buffSa.newLine();
          }else{
            direcciones.put(p.getLexema(), contvalores);
            System.out.println(p.getToken()+ " "+contvalores);
            buffSa.write(p.getToken()+ " "+ contvalores);
            buffSa.newLine();
            contvalores++;
            System.out.println(p.getLexema());
            buff.write(p.getLexema());
            buff.newLine();
          }
         }else{
          System.out.println(p.toString());
          buffSa.write(p.getToken() +" "+ p.getLexema());
          buffSa.newLine();

         }
        
       }
       buffer.close();
       buff.close();
       buffSa.close();
      }
       catch (Exception e){
         System.out.println(e.toString());
       }
       }
}
