import Foundation
class ProjectData{
    static func getAllTeamsDetailData () -> Array<Dictionary<String, AnyObject>> {
        let listTeamsData : Array<Dictionary<String, AnyObject>> = [
            [
                "bannerImage":"banner_manc" as AnyObject,
                "logoImage":"logo_manc" as AnyObject,
                "name":"托特纳姆热刺" as AnyObject,
                "intro":"曼彻斯特城足球俱乐部是一间位于曼彻斯特的足球俱乐部，前身为成立于1880年的“圣马可的西戈登”的足球队，1894年改名为“曼城”，目前于英格兰超级联赛比赛。球队主场为阿提哈德球场。\n\n2011/12赛季，曼城拿得英超赛冠奖，时隔44年终于重新获得英格兰顶级联赛冠军，2013/14赛季时隔一年后再度重夺英格兰顶级联赛冠军及联赛杯冠军成为“双冠王”。2017/18年度赛季，曼城第三次夺得英超冠军，并打破英超最高得分及最多进球等多项纪录。" as AnyObject,
                "soulImage":"soul_manc" as AnyObject,
                "soulMsg":"瓜迪奥拉\n“不管是赢球还是输球，我都会坚持我所信仰的踢法”" as AnyObject,
                "playerDatas" : [
                    ["name":"埃德森","image":"manc_p_31_ederson","position":"守门员","number":"31", "url":"http://cn.mancity.com/teams/profile/ederson-moraes"],
                    ["name":"萨内","image":"manc_p_19_Sane","position":"左边前位","number":"19", "url":"http://cn.mancity.com/teams/profile/leroy-sane"],
                    ["name":"贝尔纳多·席尔瓦","image":"manc_p_20_BSilver","position":"进攻中场","number":"20", "url":"http://cn.mancity.com/teams/profile/bernardo-silva"]
                    ] as AnyObject
            ],
            [
                "bannerImage":"banner_manc" as AnyObject,
                "logoImage":"logo_manc" as AnyObject,
                "name":"曼切斯特城" as AnyObject,
                "intro":"曼彻斯特城足球俱乐部是一间位于曼彻斯特的足球俱乐部，前身为成立于1880年的“圣马可的西戈登”的足球队，1894年改名为“曼城”，目前于英格兰超级联赛比赛。球队主场为阿提哈德球场。\n\n2011/12赛季，曼城拿得英超赛冠奖，时隔44年终于重新获得英格兰顶级联赛冠军，2013/14赛季时隔一年后再度重夺英格兰顶级联赛冠军及联赛杯冠军成为“双冠王”。2017/18年度赛季，曼城第三次夺得英超冠军，并打破英超最高得分及最多进球等多项纪录。" as AnyObject,
                "soulImage":"soul_manc" as AnyObject,
                "soulMsg":"瓜迪奥拉\n“不管是赢球还是输球，我都会坚持我所信仰的踢法”" as AnyObject,
                "playerDatas" : [
                    ["name":"埃德森","image":"manc_p_31_ederson","position":"守门员","number":"31", "url":"http://cn.mancity.com/teams/profile/ederson-moraes"],
                    ["name":"萨内","image":"manc_p_19_Sane","position":"左边前位","number":"19", "url":"http://cn.mancity.com/teams/profile/leroy-sane"],
                    ["name":"贝尔纳多·席尔瓦","image":"manc_p_20_BSilver","position":"进攻中场","number":"20", "url":"http://cn.mancity.com/teams/profile/bernardo-silva"]
                    ] as AnyObject
            ]
        ]
        return listTeamsData
    }
}
