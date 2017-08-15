
let players: [[String: Any]] = [
    
    ["name": "Joe Smith" ,"height": 42,"soccer experience": "yes","guardians name´s": "Jim and Jan Smith"],
    ["name": "Jill Tanner","height": 36,"soccer experience": "yes","guardians name´s": "Clara Tanner"],
    ["name": "Bill Bon","height": 43,"soccer experience": "yes","guardians name´s": "Sara and Jenny Bon"],
    ["name": "Eva Gordon" ,"height": 45,"soccer experience": "no","guardians name´s": "Wendy and Mike Gordon"],
    ["name": "Matt Gill" ,"height": 40,"soccer experience": "no","guardians name´s": "Charles and Sylvia Gill"],
    ["name": "Kimmy Stein" ,"height": 41,"soccer experience": "no","guardians name´s": "Bill and Gillary Stein"],
    ["name": "Sammy Adams" ,"height": 45,"soccer experience": "no","guardians name´s": "Jeff Adams"],
    ["name": "Karl Saygan" ,"height": 42,"soccer experience": "yes","guardians name´s": "Heather Bledsoe"],
    ["name": "Suzane Greenberg" ,"height": 44,"soccer experience": "yes","guardians name´s": "Henrietta Dumas"],
    ["name": "Sal Dali" ,"height": 41,"soccer experience": "no","guardians name´s": "Gala Dali"],
    ["name": "Joe kavalier" ,"height": 39,"soccer experience": "no","guardians name´s": "Sam and Elaine Kavalier"],
    ["name": "Ben Finkelstein" ,"height": 44,"soccer experience": "no","guardians name´s": "Aaron and Jill Finkelstein"],
    ["name": "Diego Soto" ,"height": 41,"soccer experience": "yes","guardians name´s": "Robin and Sarika Soto"],
    ["name": "Chloe Alaska" ,"height": 47,"soccer experience": "no","guardians name´s": "David and Jamie Alaska"],
    ["name": "Arnold Willis" ,"height": 43,"soccer experience": "no","guardians name´s": "Claire Willis"],
    ["name": "Philip Helm" ,"height": 44,"soccer experience": "yes","guardians name´s": "Thomas Helm and Eva Jones"],
    ["name": "Les Clay" ,"height": 42,"soccer experience": "yes","guardians name´s": "Wynonna Brown"],
    ["name": "Herschel Krustofski" ,"height": 45,"soccer experience": "yes","guardians name´s": "Hyman and Rachel Krustofski"]
]

func order(team: [[String: Any]]) -> ([[String: Any]],[[String: Any]],[[String: Any]]) {
    
    var orderByHeight = [[String:Any]]()
    
    //************************************************************************************
    var ascendingOrder = [[String:Any]]()
    
    for soccerPlayer in team {
        let soccerExperience = String(describing: soccerPlayer["soccer experience"]!)
        
        if soccerExperience == "no" {
            
            
            if ascendingOrder.count == 0 {
                ascendingOrder.append(soccerPlayer)
                
            }else{
                var positionRight = 0
                
                for player in ascendingOrder {
                    if (soccerPlayer["height"] as! Int) <= (player["height"] as! Int) {
                        ascendingOrder.insert(soccerPlayer, at: positionRight)
                        break
                    }else if (soccerPlayer["height"] as! Int) > (player["height"] as! Int){
                        if positionRight == (ascendingOrder.count - 1) {
                            ascendingOrder.insert(soccerPlayer, at: positionRight + 1)
                            break
                        }else{
                            positionRight += 1
                        }
                        
                    }
                    
                }
            }
            
        }
    }
    // ***************************************************************************************
    var descendingOrder = [[String: Any]]()
    for soccerPlayer in players {
        let soccerExperience = String(describing: soccerPlayer["soccer experience"]!)
        
        if soccerExperience == "yes" {
            if descendingOrder.count == 0 {
                descendingOrder.append(soccerPlayer)
                
            }else{
                var positionRight = 0
                
                for player in descendingOrder {
                    if (soccerPlayer["height"] as! Int) >= (player["height"] as! Int) {
                        descendingOrder.insert(soccerPlayer, at: positionRight)
                        break
                    }else if (soccerPlayer["height"] as! Int) < (player["height"] as! Int){
                        if positionRight == (descendingOrder.count - 1) {
                            descendingOrder.insert(soccerPlayer, at: positionRight + 1)
                            break
                        }else{
                            positionRight += 1
                        }
                        
                    }
                    
                }
            }
            
        }
    }
    // ************************************************************************************
    
    
    orderByHeight = descendingOrder + ascendingOrder
    
    var teamSharks = [[String : Any]]()
    var teamDragons = [[String : Any]]()
    var teamRaptors = [[String : Any]]()
    

    
    return (teamSharks,teamDragons,teamRaptors)
}










