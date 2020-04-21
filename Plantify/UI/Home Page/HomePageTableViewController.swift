//
//  HomePageTableViewController.swift
//  Plantify
//
//  Created by Marina Lunts on 04.02.2020.
//  Copyright © 2020 earine. All rights reserved.
//

import UIKit

class HomePageTableViewController: BaseViewController {
    
    // MARK: - properties
    
    private var image: UIImage!
    private var recentFlowersHeight: CGFloat = 120
    
    @IBOutlet private weak var homePageTableView: UITableView!
    
    // MARK: - override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBehaviour()
        setStyle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - private
    
    private func setupBehaviour() {
        homePageTableView.isHidden = true
        showActivityIndicator(true)
        
        setNib("HeaderTableViewCell")
        setNib("ExploreTableViewCell")
        setNib("RecentFlowersTableViewCell")
    }
    
    private func setStyle() {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func setNib(_ name: String) {
        let nib = UINib(nibName: name, bundle: nil)
        homePageTableView.register(nib.self, forCellReuseIdentifier: name)
    }
    
    private func presentDialogWindow() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            presentPhotoPicker(sourceType: .photoLibrary)
            return
        }
        
        let photoSourcePicker = UIAlertController()
        
        let takePhoto = UIAlertAction(title: L10n.takePhoto, style: .default) { [unowned self] _ in
            self.presentPhotoPicker(sourceType: .camera)
        }
        
        let choosePhoto = UIAlertAction(title: L10n.chooseFromLibrary, style: .default) { [unowned self] _ in
            self.presentPhotoPicker(sourceType: .photoLibrary)
        }
        
        let cancelAction = UIAlertAction(title: L10n.cancelText, style: .cancel, handler: nil)
        
        photoSourcePicker.addAction(takePhoto)
        photoSourcePicker.addAction(choosePhoto)
        photoSourcePicker.addAction(cancelAction)
        
        present(photoSourcePicker, animated: true)
    }
    
    private func presentPhotoPicker(sourceType: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = sourceType
        present(picker, animated: true)
    }
    
    private func classifyFlower() {
        let imageData: Data = image.pngData()!
        let imageStr = imageData.base64EncodedString()
        
        NetworkManager.shared.classifyFlower(from: imageStr, onSuccess: { [weak self] (flower, _) in
            guard let flower = flower else {
                return
            }
            
            //            RecentFlowersManager.shared.addFlower(flower)
            let vc = PlantDetailsViewController.instantiate(with: flower, source: .identification)
            self?.navigationController?.present(vc, animated: true, completion: nil)
            
            }, onFailure: { [weak self] (error, _) in
                self?.alert(message: L10n.errorNoClassifiedFlower, title: L10n.errorOops)
        })
    }
}

extension HomePageTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: HeaderTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            
            cell.delegate = self
            
            return cell
        case 1:
            let cell: ExploreTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.delegate = self
            
            return cell
            
        default:
            let cell: RecentFlowersTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            
            cell.delegate = self
            cell.getHeight()
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 2:
            return recentFlowersHeight
            
        default:
            return UITableView.automaticDimension
        }
    }
}

extension HomePageTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Handling Image Picker Selection
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true)
        
        let selectedImage = info[.originalImage] as! UIImage
        image = selectedImage
        
        classifyFlower()
    }
}

extension HomePageTableViewController: HeaderTableViewCellDelegate {
    func presentIdentifierDialogWindow() {
        presentDialogWindow()
    }
    
}

extension HomePageTableViewController: RecentFlowersTableViewCellDelegate {
    func recentFlowerSelected(_ flower: Flower) {
        let vc = PlantDetailsViewController.instantiate(with: flower, source: .list)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setCellHeight(_ height: CGFloat) {
        recentFlowersHeight = height + 10
        
        homePageTableView.beginUpdates()
        homePageTableView.endUpdates()
    }
    
}

extension HomePageTableViewController: ExploreTableViewCellDelegate {
    func goToOrder(_ order: Order) {
        let vc = PlantsViewController.instantiate(with: order)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToOrders(_ orders: [Order]) {
        let vc = OrdersViewController.instantiate(with: orders)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func endLoading() {
        homePageTableView.isHidden = false
        showActivityIndicator(false)
    }
}
