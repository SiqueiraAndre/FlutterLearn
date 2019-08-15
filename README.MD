# Getting Started Flutter

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

Packages Dart: https://pub.dartlang.org/flutter

## Resumo

<b>Widgets</b>
São componentes que podem ser adicionados no layout, são organizados em hierarquias para formar a tela. Consulta aos widgets: https://flutter.dev/docs/development/ui/widgets

<b>setState(() {} )</b>
Função necessária para poder se conseguir alterar o estado de um Widget na tela, qualquer coisa que altere o estado de um Widget deve estar dentro dela, se não, não será alterado. O flutter atualiza somente redenriza os componentes alterados.

<b>Statefull</b>
Altera o estado ao longo da uso da aplicação, o hot reload funciona nesses casos.

<b>Material design</b>
https://material.io

<b>Stateless</b>
Mantém o mesmo estado ao longo da aplicação, caso o pai seja stateless, não funciona o hot reload nos filhos.


# Apps Desenvolvidos e conceitos utilizados.

- [contador_de_pessoa](https://github.com/thomaserick/flutter_studies/tree/master/contador_de_pessoa): MaterialApp, StatefulWidget, setState, adição de imagem do resources (asset), Image.asset, Text, TextStyle, FlatButton, Padding, Stack, Column, debugPrint, Container, EdgeInsets, Colors;

- [calculo_imc](https://github.com/thomaserick/flutter_studies/tree/master/calculo_imc) : TextEditingController, double.parse, .toStringAsPrecision, Scaffold, AppBar, IconButton, Icons, SingleChildScrollView, GlobalKey<FormState>, Form, TextFormField, TextInputType, RaisedButton, Column;

- [conversor](https://github.com/thomaserick/flutter_studies/tree/master/conversor): async, FutureBuilder, Icon, Divider, Future, http, json, TextField, InputDecoration, OutlineInputBorder;

- [listaTarefas](https://github.com/thomaserick/flutter_studies/tree/master/listaTarefa): initState, getApplicationDocumentsDirectory, File, Future.delayed, Row, ListView, Expanded, Dismissible, DateTime, Align, CheckboxListTile, SnackBar, SnackBarAction, Duration;

- [api_giphy](https://github.com/thomaserick/flutter_studies/tree/master/api_giphy) : debugShowCheckedModeBanner, separação das telas por arquivos, Image.network, CircularProgressIndicator, AlwaysStoppedAnimation, Alignment, AsyncSnapshot, GridView, SliverGridDelegateWithFixedCrossAxisCount, GestureDetector, FadeInImage, kTransparentImage, BoxFit, Navigator, MaterialPageRoute, Share;

- [agenda_contatos](https://github.com/thomaserick/flutter_studies/tree/master/agenda_contatos): enum, PopupMenuButton, PopupMenuEntry, PopupMenuItem, FloatingActionButton, Card, BoxDecoration, BoxShape, DecorationImage, FileImage, AssetImage, showModalBottomSheet, BottomSheet, FlatButton, Navigator, sort, FocusNode, WillPopScope, FocusScope, ImagePicker, ImageSource, FileImage, AssetImage, showDialog, AlertDialog, FlatButton, Future.value, singleton, Database, fromMap, toMap;

- [chat_online](https://github.com/thomaserick/flutter_studies/tree/master/chat_online): ThemeData, GoogleSignIn, FirebaseAuth, GoogleSignInAccount, GoogleSignInAuthentication, Firestore, Theme.of(context).platform, SafeArea, StreamBuilder, CircularProgressIndicator, Divider, IconTheme, IconThemeData, IconButton, StorageUploadTask, FirebaseStorage, CupertinoButton, IconButton, CircleAvatar;

<!-- <li>loja_virtual (Screenshots): Model, notifyListeners, ScopedModel, ScopedModelDescendant, Color.fromARGB, SizedBox, ExpansionTile, Expanded, CircleAvatar, InkWell (para dar o effeito de ripple), SliverAppBar, SliverStaggeredGrid, CustomScrollView, FadeInImage.memoryNetwork, NeverScrollableScrollPhysics, drawer, VoidCallback;

flare_test : FlareActor, SplashScreen;

fluttertube : factory Video.fromJson, SearchDelegate, showSearch, Future.delayed(Duration.zero).then((_) => close(context, query)), FlutterYoutube, BlocBase, dispose, BlocProvider, StreamController, StreamBuilder, BehaviorSubject, MapEntry, SharedPreferences, cast, containsKey, remove, CircularProgressIndicator, AlwaysStoppedAnimation, Infinity scroll, stream, sink;

<li>animations : SingleTickerProviderStateMixin, AnimationController, void initState(), void dispose(), Animation, AnimatedWidget, animation.addStatusListener, animation.addListener, Tween, FlutterLogo, AnimatedBuilder, Curves.easeInOut, Curves.bounceIn, Curves.elasticOut, Curves.fastOutSlowIn, opacityTween.evaluate(animation).clamp(0.0, 1.0);

animation (Screenshots): import 'package:flutter/scheduler.dart' show timeDilation;, SafeArea, IgnorePointer; -->

# Packages Utilizados
<li>http : requisições http para API Restful;

<li>path_provider : retorna o endereço do arquivo no dispositivo;

<li>share : compartilha conteúdo do app, mostra dialog do sistema para compartilhar;

<li>transparent_image : imagem transaparent para o FadeInImage;

<li>sqflite : banco de dados SQLite;

<li>url_launcher : abre aplicativos padrão do sistema: navegador, discador, etc;

<li>image_picker : Obtém uma imagem da camera ou da galeria;

<li>cloud_firestore : acesso ao db firestore;

<li>google_sign_in : login com o google;

<li>firebase_storage : acesso ao storage (blog de imagens);

<li>firebase_auth : autenticação com o firebase;

<li>firebase_analytics : analytics do firebase;

<li>firebase_messaging : push notifications do firebase;

<li>font_awesome : icones do font awesome;

<li>flutter_staggered_grid_view : grid view staggered para flutter;

<li>carousel_pro : carrossel;

<li>scoped_model : conjunto de utilitários para passar dados de um Model para um Widget pai e seus filhos, permitindo ainda sua reconstrução caso o Model seja atualizado;

<li>flare_flutter: pacote para permitir adicionar as animações do Flare no app Flutter;

<li>flutter_youtube: player para videos do youtube;

<li>shared_preferences: acessa as configurações de usuário salvas no dispositivo;

<li>rxdart: reactive X para dart, utilizado para facilitar a implementação do BloC;

<li>bloc_pattern: ajuda na implementação do BloC pattern no flutter;
