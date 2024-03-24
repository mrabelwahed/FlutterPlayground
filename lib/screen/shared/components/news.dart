import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/screen/modules/news/article_details.dart';

Widget createArticleItem(item,context) => InkWell(
  onTap: () {
    navigateTo(context, ArticleDetails(item['url']));
  },
  child: Container(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Expanded(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
               borderRadius: BorderRadius.circular(20),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(40) ,
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage (item['urlToImage'] ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiADvr9opYUxWBQDKJDOzp7-0i70MRr5sRqwVC2_vYkQ&s'),
                  ),
                )
  
              ),
            ),
            const SizedBox(width: 10.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['title'], maxLines: 2,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 10,),
                  Text(item['publishedAt'], maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall,)
                ],
              ),
            )
          ],
        ),
      ),
    )
  ),
);

Widget articleBuilder(list, context) => ConditionalBuilder(
  condition: list.length > 0,
  builder:(context) =>  ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index) => createArticleItem(list[index], context),
      separatorBuilder: (context,index) => Divider(height: 3, color: Colors.grey,),
      itemCount: list.length
  ), fallback: (context) => Center(child: CircularProgressIndicator()) ,
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);