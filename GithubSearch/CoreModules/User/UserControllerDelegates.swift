//
//  UserControllerDelegates.swift
//  GithubSearch
//
//  Created by Guru on 27/03/2022.
//

import UIKit
import iOSUtilities

extension UserViewController:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
        
        setUpDidHighlightCellAnimation {
            cell.transform = .init(scaleX: 0.9, y: 0.9)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
        
        setUpDidUnHighlightCellAnimation {
            cell.transform = .identity
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        handleUserScrollToTheEnd()
    }
}

