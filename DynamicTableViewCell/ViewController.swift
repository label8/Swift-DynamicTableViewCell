//
//  ViewController.swift
//  DynamicTableViewCell
//
//  Created by Tsunemasa Hachiya on 2018/01/29.
//  Copyright © 2018年 Tsunemasa Hachiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let cellContents = [
        "すでに世界で最も先進的なモバイルオペレーティングシステムであるiOSに、iOS 11が新たな基準を打ち立てます。iPhoneは一段と優れたものになり、iPadはかつてないほどの能力を手に入れます。さらにこれからはどちらのデバイスにも、ゲームやアプリケーションの拡張現実のための驚くような可能性が広がります。iOS 11の登場で、iPhoneとiPadがこれまで以上にパワフルで、パーソナルで、賢いデバイスになりました。",
        "仕事をするのにも、遊ぶのにも、学ぶのにもパワフルな方法であり続けてきたiPadが、iOS 11の登場により、かつてないほどいきいきと動き出します。iOS 11の新しい機能と能力を使えば、より多くのことをよりすばやく簡単にこなせるようになり、iPadでの体験が一段とパワフルでパーソナルなものになります。あなたがいつかやりたいと思っていることを、できる日がやってきました。",
        "新しいファイルアプリケーションが、あなたのすべてのファイルをまとめます。これからは一つの場所で簡単にあなたのすべてのファイルをチェックしたり、検索したり、整理することができます。あなたが最近使ったファイルを集める専用の場所も用意しました。しかも、iPad上にあるファイルだけでなく、アプリケーション内、あなたのほかのiOSデバイス上、iCloud Driveの中、さらにはBoxやDropboxといった他社のサービスに保存したファイルにもアクセスできます。",
        "新しいDockは、iPadの体験を根本から変えます。どの画面からでもアクセスできるようになったので、スワイプするだけでアプリケーションを瞬時に開いたり切り替えることができます。より多くのお気に入りのアプリケーションを置いてカスタマイズするのも思いのままです。さらに、最近開いたアプリケーションと、iPhoneやMac上で現在開いているアプリケーションが、Dockの右側に表示されます。",
        "iOS 11は、マルチタスキングをこれまで以上に簡単で直感的なものにします。2つ目のアプリケーションをDockから直接開くことができ、どちらのアプリケーションもSlide OverとSplit Viewでアクティブな状態を保ちます。Slide Overの2つ目のアプリケーションは、左側にドラッグできます。生まれ変わったAppスイッチャーで、お気に入りのApp Spaceに戻ることもできます。",
        "ドラッグ＆ドロップがiPadにやってきました。これからはテキスト、写真、ファイルをアプリケーション間で移動できます。この機能はiPadの大きなMulti-Touchディスプレイのために作られてきたので、その体験はまるで魔法のようです。ほとんどあらゆるものを、それが複数のものでも、タッチして画面上のどこにでも動かすことができます。"
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.delegate = self
        cell.contentLabel.text = cellContents[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

extension ViewController: UITableViewDelegate {
}

extension ViewController: CustomTableViewCellDelegate {
    func didTappedShowMoreButton(cell: CustomTableViewCell) {
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
        cell.layoutIfNeeded()
    }
}


