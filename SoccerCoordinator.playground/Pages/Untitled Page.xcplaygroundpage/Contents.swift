
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
// Function that receives the array of players and returns three arrays for each team
func bestTeam(team: [[String: Any]]) -> (teamSharks: [[String: Any]],teamDragons: [[String: Any]],teamRaptors: [[String: Any]]) {
    
    var orderByHeight = [[String:Any]]()
    
//************************************************************************************
//To obtain the average we separate the boys who have experience and those who do not and order them in a descending and ascending way respectively
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
    // We join the result of the two arrays in such a way that the distribution of height us of a balanced average
    orderByHeight = descendingOrder + ascendingOrder
    
    var teamSharks = [[String : Any]]()
    var teamDragons = [[String : Any]]()
    var teamRaptors = [[String : Any]]()
    
    
    var positionRight = 0
    
    for  var player in orderByHeight {
        switch positionRight {
        case 0:
            player.updateValue("Sharks", forKey: "team")
            teamSharks.append(player)
            positionRight = 1
        case 1:
            player.updateValue("Dragons", forKey: "team")
            teamDragons.append(player)
            positionRight = 2
        default:
            player.updateValue("Raptors", forKey: "team")
            teamRaptors.append(player)
            positionRight = 0
        
        }
        
    }

    
    return (teamSharks,teamDragons,teamRaptors)
}

var team = bestTeam(team: players)
var teamSharks = team.teamSharks
var teamDragons = team.teamDragons
var teamRaptors = team.teamRaptors

var letters = [String]()


//Function that receives the array of players and creates a letter depending on the equipment to which it belongs
func letter(teams: [[String: Any]]){
    
    for player in teams {
        let team = String(describing: player["team"]!)
        switch team {
        case "Sharks":
            letters.append("Dear \(player["guardians name´s"]!) we inform you that the child \(player["name"]!) will be part of the \(player["team"]!) team and will be due on March 17th at 3 pm.")
            case "Dragons":
                letters.append("Dear \(player["guardians name´s"]!) we inform you that the child \(player["name"]!) will be part of the \(player["team"]!) team and will be due on March 17th at 1 pm.")
        default:
            letters.append("Dear \(player["guardians name´s"]!) we inform you that the child \(player["name"]!) will be part of the \(player["team"]!) team and will be due on March 18th at 1 pm.")
        }
        
    }
}

//Function that gives us the average

func average(team: [[String: Any]]) -> Float{
    
var average:Float = 0
var totalHeight = 0
let totalPlayer = Float(team.count)

for player in teamSharks {
    let height = player["height"] as! Int
    totalHeight += height
}
    average = Float(totalHeight) / totalPlayer
    return average
}


print("Averge of team Sharks is: \(average(team: teamSharks))")
print("Averge of team Dragons is: \(average(team: teamDragons))")
print("Averge of team Raptors is: \(average(team: teamRaptors))")
// ********************************************************************************



letter(teams: teamSharks)
letter(teams: teamDragons)
letter(teams: teamRaptors)

for letter in letters {
    print(letter)
}







