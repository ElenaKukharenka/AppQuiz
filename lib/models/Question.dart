

import 'package:flutter/foundation.dart';

class Question{
  //заголовок
final String title;
  //список вопросов и ответов
final List<Map> answers;

//конструктор с именованными параметрами
//@required означает , что поля обязательные
  Question({
    @required this.title,
    @required this.answers,
    });
}

class QuestionData {
  //список вопросов и ответов . 
  //Список_data Содержит объекты типа Question 
  //Question состоит из title и списка ответов answers ,
  // которые представляют собой словари из ключей и значений 
  //у правильного ответа еще один ключ-значение isCorrect
  final _data = [
    Question (
      title : 'Каких камней не бывает в речке?',
      answers:[
        {'answer' : 'Больших ',},
        {'answer' : 'Сухих',  'isCorrect': 1 },
        {'answer' : 'Круглых',},
        {'answer' : 'Зеленых',},
      ],
    ),
    Question(
      title : 'Что не вместится даже в самую большую кастрюлю?',
      answers:[
        {'answer' : 'Арбуз',},
        {'answer' : 'Мяч',},
        {'answer' : 'Крышка', 'isCorrect': 1 },
        {'answer' : 'Дыня',},
      ]
    ),
    Question(
      title : 'Завязать можно, а развязать нельзя. Что это?',
      answers:[
        {'answer' : 'Шнурки',},
        {'answer' : 'Разговор ', 'isCorrect': 1 },
        {'answer' : 'Нитка', },
        {'answer' : 'Морской узел',},
      ]
    ),
    Question(
      title : 'Чем больше из нее берешь, тем больше она становится.Что это?',
      answers:[
        {'answer' : 'Коробка',},
        {'answer' : 'Сумка',},
        {'answer' : 'Река',  },
        {'answer' : 'Яма', 'isCorrect': 1},
      ]
    ),
    Question(
      title : 'Что принадлежит Вам, но другие этим пользуются чаще, чем Вы сами?',
      answers:[
        {'answer' : 'Ваше имя', 'isCorrect': 1},
        {'answer' : 'Ваша игрушка',},
        {'answer' : 'Ваш пенал',  },
        {'answer' : 'Ваш портфель',},
      ]
    ),
    Question(
      title : 'Сколько яиц можно съесть натощак?',
      answers:[
        {'answer' : 'Два',},
        {'answer' : 'Три',},
        {'answer' : 'Одно', 'isCorrect': 1 },
        {'answer' : 'Ноль',},
      ]
    ),
    Question(
      title : 'Горели три свечи, одна свеча погасла.Сколько свечей осталось?',
      answers:[
        {'answer' : 'Три',},
        {'answer' : 'Одна', 'isCorrect': 1},
        {'answer' : 'Две',},
        {'answer' : 'Ноль',},
      ]
    ),
    Question(
      title : 'Что тяжелее: 1 килограмм ваты или 1 килограмм гвоздей?',
      answers:[
        {'answer' : 'Вата ',},
        {'answer' : 'Гвозди',},
        {'answer' : 'Смотря какие гвозди', },
        {'answer' : 'Одинаково', 'isCorrect': 1},
      ]
    ),
    Question(
      title : 'Вы сидите в самолете, впереди Вас лошадь, сзади Вас - автомобиль. Где Вы находитесь?' ,
      answers:[
        {'answer' : 'На карусели катаемся', 'isCorrect': 1},
        {'answer' : 'Во сне летаем',},
        {'answer' : 'В мультике находимся',  },
        {'answer' : 'В компьютерной игре',},
      ]
    ),
    Question(
      title : 'Какие часы показывают верное время только два раза в сутки?',
      answers:[
        {'answer' : 'Наручные',},
        {'answer' : 'Механические',},
        {'answer' : 'Которые стоят', 'isCorrect': 1 },
        {'answer' : 'Электронные',},
      ]
    ),
  ];

//возвращаем _data через геттер
//List с типом <Question> возвращает новый список
 List<Question> get questions => [..._data];
}