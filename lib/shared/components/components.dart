
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_sqflite/shared/cubit/cubit.dart';

Widget defultButton({
  double width = double.infinity,
  Color background = Colors.deepOrange,
  Color backgroundText = Colors.black,
  double reduis = 0.0,
  required String textBUtton,
  required Function function,
  }) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(reduis),
        color: background,
      ),
      width: width,
      height: 60.0,
      child: MaterialButton(
        onPressed: () {
          function;
        },
        child: Text(
          textBUtton,
          style: TextStyle(
            color: backgroundText,
          ),
        ),
      ),
    );

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: (){
        function;
      },
      child: Text(
        text.toUpperCase(),
      ),
    );
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (value){
        onChange;
      },
      onChanged: (value){
        onChange;
      },
      onTap: (){
        onTap;
      },
      validator: (value){
        validate;
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: (){
            suffixPressed;
          },
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget buildArticleItem(article,context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0,),
          image: DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children:
            [
              Expanded(
                child: Text(
                  '${article['title']}',
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${article['publishedAt']}',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        width: 15.0,
      ),
    ],
  ),
);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
void navigateTo(context,widget) => Navigator.push(context,
MaterialPageRoute(builder: (context)=>widget));
void navigateToAndReplace(context,widget)=>Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context)=>widget),
    (Route<dynamic>route) =>false,
);
Widget articleBuilder(list,context) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>
      ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index],context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10,),
   fallback: (context) => Center(child: CircularProgressIndicator()),
);

Widget TaskBuilder(Map model,context) => Dismissible(
      key:Key( model['id'].toString()),
      child: Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
      children: [
        CircleAvatar(
          radius: 40.0,
          child: Text(
              '${model['time']}'
          ),
        ),
        SizedBox(width: 20.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${model['title']}',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text('${model['data']}',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey
                ),
              ),
            ],
          ),
        ),
        IconButton(onPressed: ()
        {
          AppCubit.get(context).updateData(
              status: 'done',
              id: model['id']);
        },
            icon: Icon(Icons.done_all_sharp),
          color: Colors.green,
        ),
        IconButton(onPressed: (){
          AppCubit.get(context).updateData(
              status: 'archive',
              id:model['id']);
        },
            icon: Icon(Icons.archive_outlined),
          color: Colors.black26,
        ),
      ],
  ),
),
      onDismissed: (direction)
      {
        AppCubit.get(context).deletData(id: model['id']);

      },
    );
Widget tasksBuilder({
  required List<Map> tasks,
}) => ConditionalBuilder(
  condition: tasks.length > 0,
  builder: (context) => ListView.separated(
    itemBuilder: (context, index)
    {
      return TaskBuilder(tasks[index], context);
    },
    separatorBuilder: (context, index) => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    ),
    itemCount: tasks.length,
  ),
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          size: 100.0,
          color: Colors.grey,
        ),
        Text(
          'No Tasks Yet, Please Add Some Tasks',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  ),
);