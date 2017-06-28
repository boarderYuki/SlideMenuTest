//
//  ViewController.swift
//  SlideMenuTest
//
//  Created by yuki.pro on 2017. 6. 27..
//  Copyright © 2017년 yuki. All rights reserved.
//


// 슬라이드 오픈시에 보여질 메뉴를 만든후에
// view 1 화면으로 전체를 덮고
// 슬라이드 메뉴 클릭시 view 1 화면의 좌우 제약조건을 조절하여
// 밑에 가려져있던 사이드 메뉴를 보여지게 한다.
// 참고: https://www.youtube.com/watch?v=SGkYb820zr4


import UIKit

class ViewController: UIViewController {

    // View 1 의 트레일링과 리딩 제약조건을 아웃렛으로 만든다.
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    // 슬라이드 메뉴의 오픈 여부 파악
    var menuIsShow = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showMenu(_ sender: Any) {
        
        if menuIsShow {
            // menuIsShow 가 false 면 view 1 의 제약조건에 변화 없음
            leadingConstraint.constant = 0
            trailingConstraint.constant = 0
        } else {
            // menuIsShow 가 true 면 view 1 의 제약조건을 왼쪽으로 120 이동
            leadingConstraint.constant = -120
            trailingConstraint.constant = 120
        }
        
        // 슬라이드 애니메이션
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
        }

        // 현재 메뉴오픈 상태 반대값 입력
        menuIsShow = !menuIsShow
        
    }

}
