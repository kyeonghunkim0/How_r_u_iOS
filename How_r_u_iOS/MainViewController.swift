//
//  MainViewController.swift
//  How_r_u_iOS
//
//  Created by 김경훈 on 6/6/25.
//

import UIKit

class MainViewController: UIViewController {
    var selectImage: UIImage?
    // 로고
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    // 사진 선택 버튼
    private lazy var selectButton: UIButton = {
        let button = UIButton()
        button.setTitle("사진 선택", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(didTapSelectButton), for: .touchUpInside)
        return button
    }()
    // 사진 촬영 버튼
    private lazy var captureButton: UIButton = {
        let button = UIButton()
        button.setTitle("사진 촬영", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(didTapCaptureButton), for: .touchUpInside)
        return button
    }()
    // 버튼(선택/촬영) StackView
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        [logoImageView, buttonStackView].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [selectButton, captureButton].forEach{
            buttonStackView.addArrangedSubview($0)
        }
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            
            buttonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonStackView.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
}

extension MainViewController{
    @objc
    func didTapSelectButton(){
        print("select button tapped")
    }
}

extension MainViewController: CameraViewControllerDelegate{
    @objc
    func didTapCaptureButton(){
        print("capture button tapped")
        let cameraViewController = CameraViewController()
        cameraViewController.delegate = self
        self.present(cameraViewController, animated: true)
    }
    
    func cameraViewController(_ controller: CameraViewController, didCapture image: UIImage) {
        self.selectImage = image
        
    }
    
    func cameraViewControllerDidCancel(_ controller: CameraViewController) {
        print(#function)
    }
}
