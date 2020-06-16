import 'package:flutter/material.dart';
import 'package:qizz_app_flutter/models/Question.dart';
import 'package:qizz_app_flutter/widgets/progress_bar.dart';
import 'package:qizz_app_flutter/widgets/quiz.dart';
import 'package:qizz_app_flutter/widgets/result.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
//переменная data получает данные типа QuestionData из созданного нами класса QuestionData()
  final QuestionData data = QuestionData();
//переменная для отображения результата
  int _countResult = 0;
  //индекс вопроса
  int _questionIndex = 0;

  //список иконок для прогресс-бара
  List<Icon> _icons = [];

  //обработчик для обнуления состояний
  void _clearState() => setState(() {
    _questionIndex = 0;
    _countResult = 0;
    _icons = [];
  });

//функция для обновления результата и прогресс-бара 
void _onChangeAnswer(bool isCorrect) => setState(() {
  //если ответ правильный - добавляем сиреневую кнопку и плюсуем результат
if (isCorrect) {
  _icons.add(Icon(Icons.brightness_1, color: Color(0xFFbd27ff), ));
  _countResult++;
}else {
  //если не правильный - добавляем черную иконку 
  _icons.add(Icon(Icons.brightness_1, color: Color(0xFF000000), ));
}
//после всего увеличиваем индекс вопроса для перехода к следующему вопросу
_questionIndex += 1;
});

//переменная со стилем, чтобы стиль применить ко всем текстам
final whiteTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18,
);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(
      //  title: Text('Тестирование'),
     // ),
     //виджет SafeArea сдвигает все ниже строчки, где показывается время,заряд
      body: SafeArea(
        //оборачиваем Container в виджет DefaultTextStyle, чтобы применить к контейнеру наши стили
              child: DefaultTextStyle.merge(
                //передаем созданный нами стиль
                style: whiteTextStyle,
                child: Container(
          //растягиваем на всю ширину
          constraints: BoxConstraints.expand(),
          //украшения
          decoration: BoxDecoration(
            color: const Color(0xff2a375a),
            image: DecorationImage(
                image: AssetImage('assets/images/fon.jpg'),
                //вмещаем картинку
                fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[

                //добавляем виджет прогресс-бар на самый верх  в колонку
                //и передаем ему некоторые состояния
                ProgressBar(
                  //список иконок
                  icons: _icons,
                  //текущий вопрос
                  count: _questionIndex,
                  //сколько всего вопросов прошли
                  total: data.questions.length,
                ),

                //обработаем результат
                //если текущий индекс вопроса меньше, чем общее количество вопросов,
                //тогда выводим Quiz
                _questionIndex < data.questions.length
                ?
                //передаем виджет Quiz
                Quiz(
                  //передаем параметры
                  index: _questionIndex,
                  questionData: data,
                  onChangeAnswer: _onChangeAnswer,
                )
                //иначе выводим результаты
                : Result(
                  count: _countResult,
                  total: data.questions.length,
                  onClearState: _clearState,
                ),
                

                //временно добавляем кнопку, чтобы пролистать вопросы
                //RaisedButton(
                  //по нажатию кнопки вызываем коллбэк , устанавливаем свойство setState 
                  //внутри setState вызываем коллбэк и увеличиваем индекс вопроса на 1
                  //onPressed: () => setState(() => _questionIndex++),
                 // child: Text('Дальше'),
                  //),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
