//
//  ViewController.swift
//  Autolayout
//
//  Created by myronishyn.ihor on 26.03.2022.
//

import UIKit

final class RadioViewController: UIViewController {
    private var albumImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "albumImage")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var songProgressView: UIProgressView = {
        let progress = UIProgressView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progress = 0.5
        return progress
    }()
    
    private var volumeSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.value = 0.5
        return slider
    }()
    
    private var songLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Aerosmith - Hole In My Soul"
        label.font = UIFont.systemFont(ofSize: 22.0, weight: .medium)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    private var sharedConstraints = [NSLayoutConstraint]()
    private var portraitConstraints = [NSLayoutConstraint]()
    private var landscapeConstraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
        NSLayoutConstraint.activate(sharedConstraints)
        layoutTrait(traitCollection: UIScreen.main.traitCollection)
    }
    
    private func addSubviews() {
        view.addSubview(albumImageView)
        view.addSubview(songProgressView)
        view.addSubview(volumeSlider)
        view.addSubview(songLabel)
    }
    
    private func setupConstraints() {
        albumImageViewConstraints()
        songProcessViewConstraints()
        volumeSliderConstraints()
        songLabelConstraints()
    }
    
    private func albumImageViewConstraints() {
        sharedConstraints.append(contentsOf: [
            albumImageView.heightAnchor.constraint(equalTo: albumImageView.widthAnchor, multiplier: 1.0),
            albumImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0)
        ])
        
        portraitConstraints.append(contentsOf: [
            albumImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8.0),
            albumImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            albumImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        landscapeConstraints.append(contentsOf: [
            albumImageView.topAnchor.constraint(equalTo: songProgressView.bottomAnchor, constant: 16.0),
            albumImageView.bottomAnchor.constraint(equalTo: volumeSlider.topAnchor, constant: -16.0)
        ])
    }
    
    private func songProcessViewConstraints() {
        sharedConstraints.append(contentsOf: [
            songProgressView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            songProgressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            songProgressView.heightAnchor.constraint(equalToConstant: 4.0)
        ])
        
        portraitConstraints.append(contentsOf: [
            songProgressView.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 30.0)
        ])
        
        landscapeConstraints.append(contentsOf: [
            songProgressView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0)
        ])
    }
    
    private func volumeSliderConstraints() {
        sharedConstraints.append(contentsOf: [
            volumeSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24.0),
            volumeSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            volumeSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            volumeSlider.heightAnchor.constraint(equalToConstant: 31.0)
        ])
    }
    
    private func songLabelConstraints() {
        sharedConstraints.append(contentsOf: [
            songLabel.topAnchor.constraint(equalTo: songProgressView.bottomAnchor),
            songLabel.bottomAnchor.constraint(equalTo: volumeSlider.topAnchor)
        ])
        
        portraitConstraints.append(contentsOf: [
            songLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        landscapeConstraints.append(contentsOf: [
            songLabel.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: 16.0),
            songLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0)
        ])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layoutTrait(traitCollection: traitCollection)
    }
    
    private func layoutTrait(traitCollection: UITraitCollection) {
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraints)
        } else {
            NSLayoutConstraint.deactivate(portraitConstraints)
            NSLayoutConstraint.activate(landscapeConstraints)
        }
    }
}


