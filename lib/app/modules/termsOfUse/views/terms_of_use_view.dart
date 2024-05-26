import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/terms_of_use_controller.dart';

class TermsOfUseView extends GetView<TermsOfUseController> {
  const TermsOfUseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of use'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              'Proin ex ipsum, facilisis id tincidunt sed, vulputate in lacus. Donec pharetra faucibus leo, vitae vestibulum leo scelerisque eu. Nam enim dolor, porta at ex ut, eleifend tristique metus. Integer sit amet auctor ligula, vel dictum orci. Nam feugiat interdum nisl. Ut id velit ac ante maximus gravida. Vivamus lobortis vestibulum mauris a mollis. Nunc mollis tempus lorem eu pulvinar. Quisque mollis blandit aliquam. Nulla finibus gravida dignissim. Sed viverra mattis dictum. In ultricies tellus in auctor semper. Sed blandit arcu sem, vitae eleifend dui iaculis non.Vivamus eget aliquam dui. Integer eu arcu vel arcu suscipit ultrices quis non mauris. Aenean scelerisque, sem eu dictum commodo, velit nisi blandit magna, quis scelerisque ipsum lectus ut libero. Sed elit diam, dignissim ac congue quis, aliquam in purus. Proin ligula nulla, scelerisque quis venenatis pulvinar, congue eget neque. Proin scelerisque metus sit amet dolor tempor vehicula. Sed laoreet quis velit vitae facilisis. Duis ut sapien eu urna laoreet maximus. Donec nibh diam, vulputate vel nulla ut, viverra congue turpis. Fusce consectetur posuere purus, eget placerat nunc hendrerit at. Sed lectus dui, euismod a odio vitae, dictum dictum justo. Donec condimentum nunc vitae libero bibendum, cursus ultrices massa commodo. Proin ex ipsum, facilisis id tincidunt sed, vulputate in lacus. Donec pharetra faucibus leo, vitae vestibulum leo scelerisque eu. Nam enim dolor, porta at ex ut, eleifend tristique metus. Integer sit amet auctor ligula, vel dictum orci. Nam feugiat interdum nisl. Ut id velit ac ante maximus gravida. Vivamus lobortis vestibulum mauris a mollis. Nunc mollis tempus lorem eu pulvinar. Quisque mollis blandit aliquam. Nulla finibus gravida dignissim. Sed viverra mattis dictum. In ultricies tellus in auctor semper. Sed blandit arcu sem, vitae eleifend dui iaculis non.Vivamus eget aliquam dui. Integer eu arcu vel arcu suscipit ultrices quis non mauris. Aenean scelerisque, sem eu dictum commodo, velit nisi blandit magna, quis scelerisque ipsum lectus ut libero. Sed elit diam, dignissim ac congue quis, aliquam in purus. Proin ligula nulla, scelerisque quis venenatis pulvinar, congue eget neque. Proin scelerisque metus sit amet dolor tempor vehicula. Sed laoreet quis velit vitae facilisis. Duis ut sapien eu urna laoreet maximus. Donec nibh diam, vulputate vel nulla ut, viverra congue turpis. Fusce consectetur posuere purus, eget placerat nunc hendrerit at. Sed lectus dui, euismod a odio vitae, dictum dictum justo. Donec condimentum nunc vitae libero bibendum, cursus ultrices massa commodo.',
              style: TextStyle(
                fontSize: 16.0,
                color: const Color(0xFF2B3238),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
