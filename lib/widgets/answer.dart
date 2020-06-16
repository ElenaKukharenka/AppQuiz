import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  //создаем переменную title и инициализируем ее в конструкторе
  final String title;
  //флаг - правильность ответа
  final isCorrect;
  //функция коллбэк, указываем тип function,т.к. передаем функцию как параметр
  final Function onChangeAnswer;

//инициализируем свойсва
  Answer({Key key, 
     this.title, 
     this.isCorrect, 
     this.onChangeAnswer
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //оборачиваем контейнер в GestureDetector - определяет жесты
    return GestureDetector(
      //обрабатываем onTap и передаем нашу функцию onChangeAnswer c параметром isCorrect
      //правильно передавать коллбэк без вызова функции , но 
      //нам нужно передать в функцию параметр , поэтому делаем именно так
      onTap: () => onChangeAnswer(isCorrect),
          child: Container(
        //внешние отсупы симметричные
        margin: const EdgeInsets.symmetric(
          horizontal: 50.0,
          vertical: 5.0,
        ),
        //внутренние отступы со всех сторон
        padding: const EdgeInsets.all(10.0),
        //ширина растягивается на максимально возможную в пределах родителя
        width: double.infinity,
        //декорации
        decoration: BoxDecoration(
          //парящий эффект - список из значений
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              //смягчаем тень
              blurRadius: 10.0,
              //смещение тени
              offset: Offset(1.0, 1.0),
            ),
          ],
          //скруглим края
          borderRadius: BorderRadius.circular(30.0),
          //градиент , т.е. плавный переход из одного цвета  в другой
          gradient: LinearGradient(colors: [
            //прозрачность цвета 0xFF и цвет 5337ff
            Color(0xFF5337ff),
            Color(0xFF8131ff),
            Color(0xFFbd27ff),
          ],
          )
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          ),
        ),
    );
  }
}
