import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class EmptyInvoiceScreen extends StatelessWidget {
  const EmptyInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //1
    return Padding(
      padding: const EdgeInsets.all(30.0),
      //2
      child: Center(
        //3
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //1
            Flexible(
              //2
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/business_card_assets/empty_list.png'),
              ),
            ),
            const Text(
              'Hazır Teklifiniz Bulunmamaktadır',
              style: TextStyle(fontSize: 21.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Önceki Projeleri Görmek İçin\n'
                  '+ butonuna basınız',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              textColor: Colors.white,
              child: const Text('İncele'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.green,
              onPressed: (){
                Provider.of<TabManager>(context, listen: false).goToRecipes();
              },
            )
          ],
        ),
      ),
    );
  }
}
