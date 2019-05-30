//
//  SelectPhotoController.swift
//  smile picker
//
//  Created by 山田　怜音 on 2019/05/16.
//  Copyright © 2019 山田　怜音. All rights reserved.
//

import UIKit

class SelectPhotoController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView.dataSource = self as? UICollectionViewDataSource
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        //画面の横幅の3分の1の長さをtotalWidthとして定数
        let totalWidth: CGFloat = (self.view.frame.width / 3)
        //レイアウト設定
        let layout = UICollectionViewFlowLayout()
        //cellのサイズをtotalwidthの長の正方形で用意
        layout.itemSize = CGSize(width: totalWidth, height: totalWidth)
        //上下のcell間を0に
        layout.minimumLineSpacing = 0
        //左右のcell間を0に
        layout.minimumInteritemSpacing = 0
        collectionView.collectionViewLayout = layout
        
      
        //デリゲートとデータソースの設定をした
        
//        //ContlloerViewのレイアウトを生成
//        let layout = UICollectionViewFlowLayout()
//
//        //cell一つの大きさを設定
//        layout.itemSize = CGSizeMake(60, 60)
//
//        //cellのマージン設定
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//
//        //セクションごとのヘッダーサイズを変更
        
    }
    
    //表示するアイテムの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        //cell.backgroundColor = .white
        
        
        
        //"cell"はストーリーボードで設定したセルのID
        let testCell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        //tag番号を使ってImageViewのインスタンス生成
        let imageView = testCell.contentView.viewWithTag(1) as! UIImageView
        
        //画像配列の番号で指定された要素の画像をUIImageとする
        let cellImage = UIImage(named : "download.jpg")
        
        //UIImageをUIImageViewのimageとして設定
        imageView.image = cellImage
        
        
        return testCell
    }
    
    @IBAction func openAlbum() {
        //カメラロールを使えるか確認
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary
            ){
            
            //カメラロールから画像を表示するまで一連の流れ
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            
            // picker.AllowsEditing = true
            
            present(picker, animated: true, completion: nil)
            
            
        }
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemInSection section: Int) -> Int {
//
//        //要素数を入れる、要素以上の数字を入れるとエラーになる
//        return photos.count;
//    }
    

}
//
//extension SelectPhotoController: UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }e
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//        cell.backgroundColor = .white
//
//        return cell
//    }
//
//}
