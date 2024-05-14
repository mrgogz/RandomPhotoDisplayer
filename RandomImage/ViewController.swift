//
//  ViewController.swift
//  RandomImage
//
//  Created by Oğuzcan Beşerikli on 29.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    let button = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = randomColor()
        configureImageView()
        configureButton()
        getRandomImage()
    }
    
    func configureImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60)
        ])
    }
    
    func configureButton() {
        view.addSubview(button)
        button.backgroundColor = .systemRed
        button.setTitle("Picture!", for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 180),
            button.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    func getRandomImage() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
    
    @objc func tapButton() {
        getRandomImage()
        
        view.backgroundColor = randomColor()
    }
    
    func randomColor() -> UIColor{
        let randomColor = UIColor(red: CGFloat.random(in: 0...1),
                                  green: CGFloat.random(in: 0...1),
                                  blue: CGFloat.random(in: 0...1),
                                  alpha: 1)
        return randomColor
    }
}
