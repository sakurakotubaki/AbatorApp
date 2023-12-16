# AbatorApp

海外のサイトで、REQRESというサイトから、人のアバター画像と、名前を取得するデモアプリを作成して、REST APIから取得したデータをViewに表示するDEMOアプリを作りました。

https://reqres.in/

今回は、SwiftUIでAPIと通信するのに`Combine`という標準で使える機能を使用して、APIからデータを取得するのをやってみようと思います。

[ZennでCombineについて書いた記事](https://zenn.dev/jboy_blog/articles/c61299f92220de)

>Combine フレームワークは、時間の経過とともに値を処理するための宣言型 Swift API を提供します。これらの値は、さまざまな種類の非同期イベントを表すことができます。Combine は、パブリッシャーが時間の経過とともに変化する可能性のある値を公開し、サブスクライバーがパブリッシャーからそれらの値を受け取ることを宣言します。

このPublisherプロトコルは、時間の経過とともに一連の値を配信できる型を宣言します。パブリッシャーには、上流のパブリッシャーから受け取った値に基づいて動作し、それらを再パブリッシュするオペレーターがいます。

### 📡今回使用したCombineの機能

https://developer.apple.com/documentation/combine/anycancellable

AnyCancellable
キャンセルされたときに提供されたクロージャを実行する型消去キャンセル可能オブジェクト。

https://developer.apple.com/documentation/combine/anypublisher

AnyPublisher
別のパブリッシャーをラップすることによって型の消去を実行するパブリッシャー。

-----

SwiftUIでインターネットから、画像を表示するには、`url-image`というライブラリーが必要なので追加する。

https://github.com/dmytro-anokhin/url-image
