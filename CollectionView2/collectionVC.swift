
import UIKit

class collectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var arrImage = ["india","Agra", "Amsterdam", "Berlin", "Kolkata", "New Delhi", "New York", "brazil", "canada", "england", "united states", "mountain", "river", "volcano", "waterfall","Agra", "Amsterdam", "Berlin", "Kolkata", "New Delhi", "New York", "brazil", "canada", "england", "united states", "mountain", "river", "volcano", "waterfall"]
    
    var isSelected = [String]()
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var btnDelete: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvCell1", for: indexPath) as! cvCell1
        cell.citiesImageView.image = UIImage(named: arrImage[indexPath.row])
        
        if isSelected.contains(arrImage[indexPath.row]) {
            cell.btnCheckBox.isHidden = false
        } else {
            cell.btnCheckBox.isHidden = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 3 - 2 , height: collectionView.frame.size.height / 5 - 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell  = collectionView.cellForItem(at: indexPath) as? cvCell1
        
        if isSelected.contains(arrImage[indexPath.row]) {
            guard let index = isSelected.firstIndex(where: {$0 == arrImage[indexPath.row]}) else { return }
            isSelected.remove(at: index)
        } else {
            isSelected.append(arrImage[indexPath.row])
        }
        myCollectionView.reloadData()
    }
    
    @IBAction func btnDeleteAction(_ sender: UIButton) {
        
        for i in isSelected {
            guard let index = arrImage.firstIndex(where: {$0 == i}) else { return }
            arrImage.remove(at: index)
        }
        isSelected.removeAll()
        myCollectionView.reloadData()
    }
}

