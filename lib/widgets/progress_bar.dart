import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final icons;
  final count;
  final total;

//инициализируем свойства в конструкторе
  ProgressBar({Key key, this.icons, this.count, this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //внутренние и внешние отступы
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 30.0,
      ),
      //передаем строчку
      child: Row(
        //строка начинается сначала
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //чтобы вписать наши значения
          FittedBox(
            fit: BoxFit.contain,
            //текст показывает сколько всего вопросов и сколько уже пройдено
            child: Text(
              '$count - $total',
            ),
          ),
          //пустое расстояние
          SizedBox(
            width: 10.0,
          ),
          //выводим список иконок : разворачиваем его с помощью спред оператора
          ...icons,

        ],
      ),
    );
  }
}
