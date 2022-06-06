import 'transporte.dart';

class Viajar {
  //Na Aula 1 vamos criar uma classe para viajar, mas vamos fazer de um jeito beeem errado, que é usando números para definir o tipo de locomoção.
  // 1 = Carro; 2 = Bicicleta; 3 = Avião;
  Transporte locomocao;

  int visitas = 0;//Aula 3
  //static int viagens = 0; //Aula 3
  static int _viagens = 0; //Aula 4
  static String test = 'test';
  Viajar({required this.locomocao});

  void visitar(){
    visitas++;
    _viagens++;
    print('Você visitou esse lugar $visitas vezes \n Você já fez um total de $_viagens viagens \n');
  } //Aula 3

  int get numeroDeViagens{// permite apenas acessar o dado privado
    return _viagens;
  }//Aula 4

  void set alterarViagens(int novoValor){// o tipo do set tem que ser void, ou sem nada!
  if(novoValor < visitas){// podemos inclusive fazer com que coisas indesejaveis não possam acontecer.
    print('O valor de viagens total é menor que o valor de visitas ao local selecionado, isso não faz sentido. Alterando o valor desejado para o valor padrão');
    _viagens = visitas;
  }else {
    _viagens = novoValor;
    }
  }

  //Muito trabalho pra mudar uma informação né? ESSA É A IDEIA

  void aventura() {
    //esse modo de definir a locomocao é péssimo, pois não é intuitivo, imagina se nos temos 100 tipos diferentes de locomocao? teremos que ir na tabela para assegurar que o numero escolhido é o correto...
    if (locomocao == 1) {
      print('Estou indo numa Aventura de Carro!');
    } else if (locomocao == 2) {
      print('Estou indo numa Aventura de Carro!');
    } else if (locomocao == 3) {
      print('Estou indo numa Aventura de Carro!');
    } else {
      print('Estou indo numa Aventura!');
    }
  } //Aula 1

  void aventura2() {
    //aqui vamos usar o Enums para melhorar
    //também vamos usar switch and case, que foram disponibilizados num para saber mais do curso 1.
    switch (locomocao) {
      case Transporte.carro:
        print('Estou indo numa Aventura de Carro!');
        break;
      case Transporte.bicicleta:
        print('Estou indo numa Aventura de Bike!');
        break;
      case Transporte.onibus:
        print('Estou indo numa Aventura de Busão!');
        break;
      case Transporte.aviao:
        print('Estou indo numa Aventura de Avião!');
        break;
      case Transporte.andando:
        print('Estou indo numa Aventura a Pé!');
        break;
      case Transporte.helicoptero:
        print('Estou indo numa Aventura de Helicóptero!');
        break;
      case Transporte.patins:
        print('Estou indo numa Aventura de Patins!');
        break;
      case Transporte.skate:
        print('Estou indo numa Aventura de Skate!');
        break;
      default:
        {
          print('Estou indo numa Aventura!');
        }
    }
  } //Aula 1
}