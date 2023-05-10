%%
%public
%class AnalizadorLexico
%{
 
 /* Código personalizado */
 
 // Se agregó una propiedad para verificar si existen tokens pendientes
 private boolean TokenExist = false;
 
 public boolean existenTokens(){
 return this.TokenExist;
 }
%}
 
 /* Al utilizar esta instrucción, se le indica a JFlex que devuelva objetos del tipo TokenPersonalizado */
%type Token

%init{
 /* Código que se ejecutará en el constructor de la clase */
%init}
 
%eof{
 
 /* Código a ejecutar al finalizar el análisis, en este caso cambiaremos el valor de una variable bandera */
 this.TokenExist = false;
 
%eof}
 
/* Inicio de Expresiones regulares */
/*Nuevos Tokens*/
ParentIzq="("
ParentDer=")"
CorchIzq="["
CorchDer="]"
Caso = "case"
Mientras="While"
FinFuncion="die"|"exit"|"END"
AccionesFuncion="co_await"|"co_return"|"co_yield"|"decltype"|"inline"
Coma=","
GradodeAcceso = "public"|"private"|"protected"
CambiosClases="abstract"|"explicit"|"extends"|"super"|"friend"
AccionesCiclo="next"|"redo"
AccionesMetodos="alias"|"export"
ModificarHilo="atomic_cancel"|"atomic_commit"|"atomic_noexcept"
PilaSalida="pop"
PilaEntrada="push"
FinalSeleccion="endswitch"

/*Fin*/
Metodos="Method"
TipodeDato="void"|"global"|"complex"|"wchar_t"|"int"|"float"|"final"|"var"|"let"|"const"|"double"|"char"|"bool"|"auto"|"char8_t"|"char16_t"|"char32_t"|"enum"|"long"|"short"|"signed"|"unsigned" 
Clases="class"
Referencias="this"|"requires"
Funcion="def"|"function"|"declare"
Condicion="if"|"endif"|"endwhile"|"elseif"
Negaciondecondicion="else"
Ciclo="for"|"do"|"continue"|"endfor"|"foreach"|"in" 
//
Alineamiento="alignas"|"alignof"
OperadorMatema="add"|"adc"|"dec"|"div"|"mul"|"sub"
OperadorLogico="and"|"bitand"|"bitor"|"compl"|"not"|"or"|"xor"|"not"
OperadorAsignacion="and_eq"|"or_eq"|"xor_eq" 
Ensamblador="asm"|"lea"|"mov"|"shl"|"shr"
Concepto="concept"|"register"|"insteadof"|"trait"|"extern"
Evaluador="defined"|"isset"|"constveal"|"constexpr"|"constinit"|"static_assert"|"typedef"|"typeid"|"typename"|"instaceof"|"empty"|"eval"
Cambiardato="const_cast"|"reinterpret_cast"|"mutable"|"union"|"volatile"|"dynamic_cast"|"as" 
Verdadero="true" 
Falso="false"
Saltar="goto"|"jump"|"jmp"|"jnz"
Objetos="namespace"|"new"|"clone"|"use"
Excepciones="nullpointerexception"|"arrayindexoutofboundsexception"|"arithmeticexception"|"ioexception"|"filenotfoundexception"|"classcastexception"|"illegalstateexception"|"illegalargumentexception"|"securityexception"|"outofmemoryerror"|"stackoverflowerror"|"concurrentmodificationexception"|"socketexception"|"unsupportedoperationexception"|"parseexception"|"numberformatexception"|"nosuchmethodexception"|"nosuchfieldexception"|"interruptedexception"|"assertionerror"|"classnotfoundexception"|"instantiationexception"|"illegalaccessexception"|"noexcept"|"rescue"
Nulo="null"|"nullptr"
Estructura="struct"|"array"|"list"
Plantilla="template"
Hilo="thread_local"|"thread" 
Importar="using"|"include"|"require"|"require_once"
Interfaz="implements"|"interface" 
PilaEntrada="push" 
Imprimir="echo"|"print"
EjecutaCodigo="finally"
Modulo="module"
//
Salirciclo="break"
Devolvervalorfuncion="return"|"ret"
Seleccion="switch"
Subclase="virtual"|"operator"
Eliminarinstancia="delete"|"explicit"
Intentar="try"|"retry"
Atraparerror="catch"
Lanzarerror="throw"
Finalcodigo=";"
Separacion="."
IncioEstructura="{"|"BEGIN"|"begin"
FinalEstructura="}"|"enddeclare"|"end"
Asignacion="="
Comparador="<"|">"|"=="|"cmp"|">="|"<="
Variables = [a-z,A-Z]{1}[a-zA-Z0-9\\-]*
Numero = [0-9]+
Comentar= "//"
EscrituraIni = "'"
EscrituraFin = "'"
SaltoDeLinea = \n|\r|\r\n
Espacio = " "
 

/* Finaliza expresiones regulares */
 
%%
/* Finaliza la sección de declaraciones de JFlex */
 
/* Inicia sección de reglas */
 
// Cada regla está formada por una {expresión} espacio {código}
 
{ParentIzq} {
 Token t = new Token("", "Parentesis Izquierdo");
 this.TokenExist = true;
 return t;
}

{ParentDer} {
 Token t = new Token("", "Parentesis Derecho");
 this.TokenExist = true;
 return t;
}

{CorchIzq} {
 Token t = new Token("", "Corchete Izquierdo");
 this.TokenExist = true;
 return t;
}

{CorchDer} {
 Token t = new Token("", "Corchete Derecho");
 this.TokenExist = true;
 return t;
}

{Caso} {
 Token t = new Token("", "Caso");
 this.TokenExist = true;
 return t;
}

{Mientras} {
 Token t = new Token("", "Mientras");
 this.TokenExist = true;
 return t;
}

{FinFuncion} {
 Token t = new Token(yytext(), "Fin de funcion");
 this.TokenExist = true;
 return t;
}

{AccionesFuncion} {
 Token t = new Token(yytext(), "AccionFuncion");
 this.TokenExist = true;
 return t;
}


{Metodos} {
 Token t = new Token("", "Metodos");
 this.TokenExist = true;
 return t;
}

{Coma} {
 Token t = new Token("", "Coma");
 this.TokenExist = true;
 return t;
}

{GradodeAcceso} {
 Token t = new Token(yytext(), "GradodeAcceso");
 this.TokenExist = true;
 return t;
}

{CambiosClases} {
 Token t = new Token(yytext(), "CambiosClases");
 this.TokenExist = true;
 return t;
}

{AccionesCiclo} {
 Token t = new Token(yytext(), "AccionesCiclo");
 this.TokenExist = true;
 return t;
}

{AccionesMetodos} {
 Token t = new Token(yytext(), "AccionesMetodos");
 this.TokenExist = true;
 return t;
}

{ModificarHilo} {
 Token t = new Token(yytext(), "ModificarHilo");
 this.TokenExist = true;
 return t;
}

{PilaSalida} {
 Token t = new Token("", "PilaSalida");
 this.TokenExist = true;
 return t;
}

{PilaEntrada} {
 Token t = new Token("", "PilaEntrada");
 this.TokenExist = true;
 return t;
}

{FinalSeleccion} {
 Token t = new Token("", "FinalSeleccion");
 this.TokenExist = true;
 return t;
}


{TipodeDato} {
 Token t = new Token(yytext(), "TipodeDato");
 this.TokenExist = true;
 return t;
}

{Clases} {
 Token t = new Token(yytext(), "Clases");
 this.TokenExist = true;
 return t;
}

{Referencias} {
 Token t = new Token(yytext(), "Referencias");
 this.TokenExist = true;
 return t;
}

{Funcion} {
 Token t = new Token(yytext(), "Funcion");
 this.TokenExist = true;
 return t;
}

{Condicion} {
 Token t = new Token(yytext(), "Condicion");
 this.TokenExist = true;
 return t;
}

{Negaciondecondicion} {
 Token t = new Token("", "Negaciondecondicion");
 this.TokenExist = true;
 return t;
}

{Ciclo} {
 Token t = new Token(yytext(), "Ciclo");
 this.TokenExist = true;
 return t;
}
{Alineamiento} {
 Token t = new Token(yytext(), "Alineamiento");
 this.TokenExist = true;
 return t;
}

{OperadorMatema} {
 Token t = new Token(yytext(), "OperadorMatematico");
 this.TokenExist = true;
 return t;
}

{OperadorLogico} {
 Token t = new Token(yytext(), "OperadorLogico");
 this.TokenExist = true;
 return t;
}

{OperadorAsignacion} {
 Token t = new Token(yytext(), "OperadorAsignacion");
 this.TokenExist = true;
 return t;
}

{Ensamblador} {
 Token t = new Token(yytext(), "Ensamblador");
 this.TokenExist = true;
 return t;
}

{Atomico} {
 Token t = new Token(yytext(), "Atomico");
 this.TokenExist = true;
 return t;
}

{Concepto} {
 Token t = new Token(yytext(), "Concepto");
 this.TokenExist = true;
 return t;
}

{Evaluador} {
 Token t = new Token(yytext(), "Evaluador");
 this.TokenExist = true;
 return t;
}

{Cambiardato} {
 Token t = new Token(yytext(), "Cambiardato");
 this.TokenExist = true;
 return t;
}

{Verdadero} {
 Token t = new Token("", "Verdadero");
 this.TokenExist = true;
 return t;
}

{Falso} {
 Token t = new Token("", "Falso");
 this.TokenExist = true;
 return t;
}

{Saltar} {
 Token t = new Token(yytext(), "Saltar");
 this.TokenExist = true;
 return t;
}

{Objetos} {
 Token t = new Token(yytext(), "Objetos");
 this.TokenExist = true;
 return t;
}

{Excepciones} {
 Token t = new Token(yytext(), "Excepciones");
 this.TokenExist = true;
 return t;
}

{Nulo} {
 Token t = new Token(yytext(), "Nulo");
 this.TokenExist = true;
 return t;
}

{Estructura} {
 Token t = new Token(yytext(), "Estructura");
 this.TokenExist = true;
 return t;
}

{Plantilla} {
 Token t = new Token(yytext(), "Plantilla");
 this.TokenExist = true;
 return t;
}

{Hilo} {
 Token t = new Token(yytext(), "Hilo");
 this.TokenExist = true;
 return t;
}

{Importar} {
 Token t = new Token(yytext(), "Importar");
 this.TokenExist = true;
 return t;
}

{Interfaz} {
 Token t = new Token(yytext(), "Interfaz");
 this.TokenExist = true;
 return t;
}

{Pila} {
 Token t = new Token(yytext(), "Pila");
 this.TokenExist = true;
 return t;
}

{Imprimir} {
 Token t = new Token(yytext(), "Imprimir");
 this.TokenExist = true;
 return t;
}

{EjecutaCodigo} {
 Token t = new Token(yytext(), "EjecutaCodigo");
 this.TokenExist = true;
 return t;
}

{Modulo} {
 Token t = new Token(yytext(), "Modulo");
 this.TokenExist = true;
 return t;
}


{Salirciclo} {
 Token t = new Token("", "Salirciclo");
 this.TokenExist = true;
 return t;
}

{Devolvervalorfuncion} {
 Token t = new Token(yytext(), "Devolvervalorfuncion");
 this.TokenExist = true;
 return t;
}

{Seleccion} {
 Token t = new Token(yytext(), "Seleccion");
 this.TokenExist = true;
 return t;
}



{Privado} {
 Token t = new Token(yytext(), "Privado");
 this.TokenExist = true;
 return t;
}

{Subclase} {
 Token t = new Token(yytext(), "Subclase");
 this.TokenExist = true;
 return t;
}

{Eliminarinstancia} {
 Token t = new Token(yytext(), "Eliminarinstancia");
 this.TokenExist = true;
 return t;
}

{Intentar} {
 Token t = new Token(yytext(), "Intentar");
 this.TokenExist = true;
 return t;
}

{Atraparerror} {
 Token t = new Token(yytext(), "global");
 this.TokenExist = true;
 return t;
}

{Lanzarerror} {
 Token t = new Token(yytext(), "Lanzarerror");
 this.TokenExist = true;
 return t;
}

{Finalcodigo} {
 Token t = new Token(yytext(), "Finalcodigo");
 this.TokenExist = true;
 return t;
}

{Separacion} {
 Token t = new Token(yytext(), "Separacion");
 this.TokenExist = true;
 return t;
}



{IncioEstructura} {
 Token t = new Token(yytext(), "IncioEstructura");
 this.TokenExist = true;
 return t;
}

{FinalEstructura} {
 Token t = new Token(yytext(), "FinalEstructura");
 this.TokenExist = true;
 return t;
}

{Asignacion} {
 Token t = new Token("", "Asignacion");
 this.TokenExist = true;
 return t;
}

{Comparador} {
 Token t = new Token(yytext(), "Comparador");
 this.TokenExist = true;
 return t;
}

{Variables} {
 Token t = new Token(yytext(), "Variables");
 this.TokenExist = true;
 return t;
}

{Numero} {
 Token t = new Token(yytext(), "Numero");
 this.TokenExist = true;
 return t;
}

{SaltoDeLinea} {
 //
}
{Espacio} {
//
}






