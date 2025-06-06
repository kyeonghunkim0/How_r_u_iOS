//
//  FaceAnalyzeResponseModel.swift
//  How_r_u_iOS
//
//  Created by 김경훈 on 6/6/25.
//

import Foundation

struct FaceAnalyzeResponseModel: Decodable {
    let annotated_image: String
    let emotion: Emotion
    let face_count: Int
}

struct Emotion: Decodable{
    let confidence: Double
    let label: String
    let probabilities: EmotionDetail
    
    enum Codingkeys: String, CodingKey {
        case confidence
        case label
        case probabilities
    }
}

struct EmotionDetail: Decodable{
    let angry: Double       // 분노
    let disgust: Double     // 혐오
    let fear: Double        // 공포
    let happy: Double       // 행복
    let neutral: Double     // 중립
    let sad: Double         // 슬픔
    let surprise: Double    // 놀람
    
    enum CodingKeys: String, CodingKey {
        case angry = "Angry"
        case disgust = "Disgust"
        case fear = "Fear"
        case happy = "Happy"
        case neutral = "Neutral"
        case sad = "Sad"
        case surprise = "Surprise"
    }
}
