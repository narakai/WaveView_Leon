//
//  ViewController.swift
//  WaveView_Leon
//
//  Created by lai leon on 2017/9/6.
//  Copyright © 2017 clem. All rights reserved.
//

import UIKit

let YHRect = UIScreen.main.bounds
let YHHeight = YHRect.size.height
let YHWidth = YHRect.size.width

class ViewController: UIViewController {

    let wave: WaveView = {
        let wave = WaveView(frame: CGRect(x: 0.0, y: 200.0, width: YHWidth, height: 31))
        wave.waveSpeed = 10
        wave.angularSpeed = 1.5
        wave.waveColor = .orange
        return wave
    }()

    let whiteView: UIView = {
        let whiteView = UIView(frame: CGRect(x: 0.0, y: 230, width: YHWidth, height: YHHeight - 230))
        whiteView.backgroundColor = .white
        return whiteView
    }()

    let btn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 100, y: 400, width: YHWidth - 200, height: 30))
        btn.setTitle("开始", for: .normal)
        btn.setTitle("结束", for: .selected)
        btn.setTitleColor(.orange, for: .normal)
        btn.addTarget(self, action: #selector(changeStatus(_:)), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
    }


    private func setupView() {
        view.addSubview(wave)
        view.addSubview(whiteView)
        view.addSubview(btn)
    }

    func changeStatus(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.isSelected ? wave.startWave() : wave.stopWaver()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
