import 'package:flutter/material.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {

  //создаем свойства
  final index;
  final questionData;
  //функция
  final onChangeAnswer;

//инициализируем свойства в конструкторе
  Quiz({Key key, 
    this.index, 
    this.questionData, 
    this.onChangeAnswer
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
              //внутренний отступ со всех сторон
              padding: const EdgeInsets.all(10),
              child: Text(
                //выводим данные
                //обращаемся к data , потом к списку вопросов questions ,
                //обращаемся к вопросу  по индексу и выводим его заголовок
                questionData.questions[index].title,
              //применяем созданный нами в main стиль 
              //style: Theme.of(context).textTheme.caption,
              ),
            ),
            //проходим по списку ответов и выводим их на экран
            //мапим , т.е. с помощью функции map() перебираем ответы
            //возвращаем виджет Answer
            //переводим значения в список с помощью метода toList
            //чтобы данные отобразились разворачиваем их с помощью пред оператора в виджет нашу колонку
            ...questionData.questions[index].answers.map(
              (value) => Answer(
              title: value['answer'],
              //передаем функцию onChangeAnswer , где будет меняться состояние
              //передаем как функцию , поэтому скобки не нужны , т.е. мы ее не вызываем
              onChangeAnswer: onChangeAnswer,
              //правильность
              //проверяем , содержит ли value ключ isCorrect
              isCorrect: value.containsKey('isCorrect') ? true : false,
              ),
              ).toList(),
      ],
    );
  }
}