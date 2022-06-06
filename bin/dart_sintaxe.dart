import 'transporte.dart';
import 'viajar.dart';

void main(List<String> arguments) {
  //versão do Dart -> 2.14.0

  /*Aula 1 Sintaxe
  - Slide explicado sobre a estrutura da sintaxe em:
  Objetos (criação de objetos)
  Variáveis (int,bool,String)
  Classes (estrutura das Classes)
  **ISSO É UMA REVISÃO DO ULTIMO CURSO BASICAMENTE
  -Novo Recurso: Enums (adicionado fora da main)
  */
  Viajar jalapao = Viajar(locomocao: Transporte.carro);
  jalapao.aventura(); // codigo sem enum
  jalapao.aventura2(); // codigo com enum

  /*Aula 2 Collections ( Não esquecer de mostrar a Documentação )
* Explicar o conceito de Collections e o armazenamento/manipulação de Dados.
  * Relembrar de Listas
  * - Novo conceito: Iterables
  *   - Coleção de Elementos que podem ser acessados SEQUENCIALMENTE. (Ordem)
  * Sets
  * - Problema que o Set resolve: Valores repetidos
  * - Mostrar Sintaxe de Sets
  * - Coleção onde a inputs repetidos são ignorados.
  * - Mostrar Comparação entre sets.
  * Maps
  * - Problemas que o Maps resolve: Lista de Listas
  * - Mostrar Sintaxe de Maps
  * - Coleção onde há valores e chaves
  * Queue * -> Se ficar curto adicionar Queue na Aula.
  * */
  List<String> destinos = [
    'Jalapão',
    'Chapada dos Veadeiros',
    'João Pessoa',
    'Chapada dos Veadeiros'
  ];
  print(destinos);

  Set destinosVisitados = <String>{ // se ficar curto adicionar elementos no Set.
    'Rio de Janeiro',
    'Chapada dos Veadeiros',
    'São Paulo',
    'Chapada dos Veadeiros',
  };
  print(destinosVisitados);

  Set destinosDesejados = <String>{
    'Jalapão',
    'Califórnia',
    'Gramado',
    'Chapada Diamantina',
    'São Paulo'
  };
  print(destinosDesejados.intersection(destinosVisitados));

  //Map Literal
  Map<String, String> motivoMap = { // se ficar curto adicionar Elementos no Map
    'Jalapão': 'Natureza',
    'Califórnia': 'Arte',
    'Gramado': 'Chocolate',
    'Chapada Diamantina': 'Cachoeiras',
    'São Paulo': 'Compras',
  };
  print(motivoMap);
  //Map Contrutor
  Map<String, dynamic> precoMap = {
    'Jalapão': 2380.00,
    'Califórnia': 'MUITO CARO',
    'Gramado': 1200,
    'Chapada Diamantina': 600,
    'São Paulo': 'Barato',
  };
  print(precoMap);

  /*Aula 3 Dinamismo
  * Variável Dinâmica:
  *   Quando criamos uma variável ela recebe um tipo e esse tipo não pode ser alterado
  * porem quando usamos a tipagem dynamic, significa que o TIPO da variável pode ser alterado!
  *
  * Variável Estática:
  *   Quando criamos uma variável, ela é salva na memória. Porém quando criamos uma variável
  * numa Classe, ela pode ser gerada várias vezes, devido a criação de objetos dessa Classe.
  * Sempre que criamos um objeto, uma nova parte da memória vai ser usada para armazenar
  * a variável.
  * Porém quando usamos STATIC, o local da memória é sempre o mesmo, independente de quantos
  * objetos sejam criados, permitindo que o valor seja compartilhado entre todos os objetos.
  *
  * Linguagem Estática:
  *   Linguagens que verificam o tipo das variáveis antes de rodar o código.
  * Isso permite que o compilador nos mostre quando a mudança de um tipo pode causar
  * problemas no nosso código.
  * Ou seja, normalmente não podemos mudar a tipagem de objetos.
  * Linguagem Dinâmica:
  * Linguagens que verificam o tipo das variáveis na hora em que você rodar o código.
  * Mostrar no código o que acontece se fizermos uma variável dynamic que pode dar erro.
  * */
// Variaveis Dynamic
  var precoX = 1;// variavel do tipo num( int ou double)
  print(precoX.runtimeType);// prova Real
  // x = "frase"; -> vai brigar com a gente porque não podemos alterar a tipagem.


  dynamic precoY; // não sabe o tipo
  precoY = 1; // agora é um int
  print(precoY.runtimeType);
  precoY ='frase'; // agora é uma String
  print(precoY.runtimeType);


  //Variáveis Static
  jalapao.visitar();
  jalapao.visitar();
  jalapao.visitar();
  //mas e se eu for pra outro lugar?
  Viajar chapada = Viajar(locomocao: Transporte.bicicleta);
  chapada.visitar();
  chapada.visitar();

  //Problema Static Dynamic:

  // num z = precoX + precoY; // se y não for um numero, o que acontece?
  // note que o compilador não está reclamando...
  // print(z); -> vai dar um erro porque não da pra somar int com String...

  /*Aula 4 Encapsulamento
  * -Encapsular:
  *   Quando queremos impedir que as informações de dentro da nossa classe sejam acessadas
  * facilmente, devemos começar a privatizar nossos parametros e métodos. A conduta de privatização
  * facilita a manutenção do seu código e impede que informações delicadas sejam manipuladas
  * levianamente.
  * -Getter:
  *   Simplesmente Pegar os dados da informação que não é acessível por fora.
  * (habilitar a ação de pegar algo que não é seu)
  * -Setter:
  *   Simplesmente Alterar a informação que não é alterável por fora.
  * (mudar valores de algo que não é seu)
  * */

  //Agora eu quero mexer diretamente no valor da minha quantidade de visitas
  chapada.visitas = 20;
  print(chapada.visitas);
  //E se eu quiser acessar o numero total de viagens?
  //print(Viajar._viagens); -> não podemos mais acessar (Aula 4.2)
  //E se eu tentar altera-la?
  //Viajar._viagens = 19;
  //print(Viajar._viagens);
  //Não quero que essa informação seja facilmente alterada, quero que ela seja protegida.

  //mesmo depois de alterar para uma classe privada ainda podemos acessa-la,
  //vamos agora tirar a classe viagens desse arquivo!

  //Agora que de fato refatoramos o código a informação de _viagens está completamente inacessível.
  //Para acessá-la, devemos usar Get  e para altera-la devemos usar o Set.


  //Viajar.numeroDeViagens; -> não conseguimos acessar
  print(jalapao.numeroDeViagens) ; //Agora podemos acessar nosso valor estatico pelo objeto instanciado(criado)

  //mas ainda não podemos alterar, para isso devemos criar o Set.
jalapao.alterarViagens = 200;
print(jalapao.numeroDeViagens);


  /*Aula 5 Callbacks


  */
}





