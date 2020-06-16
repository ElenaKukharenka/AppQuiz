import 'package:flutter/material.dart';

class Result extends StatelessWidget {

  //свойства
  final int count;
  final int total;
  //передаем функцию, чтобы обнулять состояние
  final Function onClearState;

//инициализируем  свойства в конструкторе
  Result({Key key, this.count, this.total, this.onClearState}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //блок с обработкой результата
    String msg = '';
    Widget img;
    //вывод сообщения в зависимости от результата
    if(0 <= count && count <= 3){
      msg = 'Плохо!';
      img = Image.asset('assets/images/bad.png');
    } else if((4 <= count && count <= 7)){
      msg = 'Нормально';
      img = Image.asset('assets/images/norm.jpg');
    } else {
      msg = 'Отлично';
      img = Image.asset('assets/images/good.jpg');
    }

    return Container(
      //внешние и внутренние отступы
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      //стили
      decoration: BoxDecoration(
        //тени
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 5.0),
          ),
        ],
        //скругленные края
        borderRadius: BorderRadius.circular(30.0),
        // градиент
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF5337ff),
            Color(0xFF8131ff),
            Color(0xFFbd27ff),
          ],
          ),
      ),
      child: Column(
        children: <Widget>[
          //контейнер с высотой и шириной 120
          Container(
            width: 120,
            height: 120,
            //помещаем в контейнер Box с картинкой-результатом
            child: FittedBox(
              fit: BoxFit.contain,
              child: img,
            ),
          ),

          //контейнер с текстом - сообщением результата
          Container(
            child: Text(
              msg,
              //текст выравниваем по центру
              textAlign: TextAlign.center,
            ),
          ),

          //отделяющие белые линии
          Divider(
            color: Colors.white,
          ),
          
          //вывод результата
          Text(
            'Верно ответил на $count из $total вопросов', 
          ),
          
          //отделяющие белые линии
          Divider(
            color: Colors.white,
          ),

          //добавляем кнопку Пройти еще раз
          FlatButton(
            //передаем функцию без вызова, поэтому скобки не ставим
            onPressed: onClearState, 
            child: Text(
              'Пройти еще раз',
              style: TextStyle(
                fontSize: 22.0,
              ),
              ),
            ),

        ],
      ),
    );
  }
}