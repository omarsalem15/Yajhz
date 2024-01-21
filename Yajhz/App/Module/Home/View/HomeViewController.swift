//
//  Home.swift
//  Yajhz
//
//  Created by Omar Salem on 19/01/2024.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController,HomeViewProtocol {
    
    @IBOutlet weak var categoriesCollView: UICollectionView!
    @IBOutlet weak var popularCollView: UICollectionView!
    @IBOutlet weak var trendingCollView: UICollectionView!
    
    private var globalBaseCategories: [BaseCategoriesData] = []
    private var globalPopular: [PopularRestaurantListData] = []
    private var globalTrending: [TrendingRestaurantData] = []
    
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        presenter = HomePresenter(view: self)
        
        presenter?.getBaseCategories()
        presenter?.getTrendingSellers()
        //        presenter?.getPopularSellers()
        
        categoriesCollView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "categoriesCell")
        categoriesCollView.delegate = self
        categoriesCollView.dataSource = self
        
        popularCollView.register(UINib(nibName: "PopularCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "popularCell")
        popularCollView.delegate = self
        popularCollView.dataSource = self
        
        trendingCollView.register(UINib(nibName: "TrendingCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "trendingCell")
        trendingCollView.delegate = self
        trendingCollView.dataSource = self
        
        title = "Home"
        
        
        categoriesCollView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: .main),forCellWithReuseIdentifier: "categoriesCell")
        
        categoriesCollView.delegate = self
        categoriesCollView.dataSource = self
        
        
        
        popularCollView.register(UINib(nibName: "PopularCollectionViewCell", bundle: .main),forCellWithReuseIdentifier: "popularCell")
        
        popularCollView.delegate = self
        popularCollView.dataSource = self
        
        
        trendingCollView.register(UINib(nibName: "TrendingCollectionViewCell", bundle: .main),forCellWithReuseIdentifier: "trendingCell")
        
        trendingCollView.delegate = self
        trendingCollView.dataSource = self
        
        
        
        title = "Home"
        
    }
    
    func updateBaseCategories(_ baseCategories: [BaseCategoriesData]) {
        globalBaseCategories = baseCategories
        DispatchQueue.main.async {
            self.categoriesCollView.reloadData()
        }
    }
    
    func updateTrendingSellers(_ trendingSellers: [TrendingRestaurantData]) {
        globalTrending = trendingSellers
        DispatchQueue.main.async {
            self.trendingCollView.reloadData()
        }
    }
    
    //    func updatePopularSellers(_ popularSellers: [PopularRestaurantListData]) {
    //        globalPopular = popularSellers
    //        DispatchQueue.main.async {
    //            self.popularCollView.reloadData()
    //        }
    //    }
    
}



extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoriesCollView:
            return globalBaseCategories.count
        case trendingCollView:
            return globalTrending.count
        case popularCollView:
            return globalPopular.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoriesCollView:
            let cell = categoriesCollView.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as! CategoriesCollectionViewCell
            cell.categoryName.text = globalBaseCategories[indexPath.row].name_en
            let imageURL = URL(string: globalBaseCategories[indexPath.row].image)
            cell.categoryImageView.sd_setImage(with: imageURL)
            return cell
            
        case trendingCollView:
            let cell = trendingCollView.dequeueReusableCell(withReuseIdentifier: "trendingCell", for: indexPath) as! TrendingCollectionViewCell
            let imageURL = URL(string: globalTrending[indexPath.row].logo)
            cell.trendingImage.sd_setImage(with: imageURL)
            return cell
            
            //            case popularCollView:
            //                let cell = popularCollView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as! PopularCollectionViewCell
            //                // Configure the cell for popular sellers if needed
            //                // cell.configure(with: globalPopular[indexPath.row])
            //                return cell
            
        default:
            return UICollectionViewCell()
        }
    }
}



