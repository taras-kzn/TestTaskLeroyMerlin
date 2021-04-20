//
//  Section.swift
//  TestTaskLeroyMerlin
//
//  Created by admin on 18.04.2021.
//

import Foundation

struct SectionModel: Hashable {
    
    let type: String
    let title: String
    let items: [ItemModel]
}

var sections = [SectionModel(type: "Поиск",
                             title: "",
                             items: [ItemModel(image: "barcode.viewfinder",
                                               price: 0,
                                               description: "")]),
                SectionModel(type: "Каталог",
                             title: "Каталог",
                             items: [ItemModel(image: "каталог",
                                               price: 0,
                                               description: "ц"),
                                     ItemModel(image: "Заборы",
                                               price: 13,
                                               description: "qefwq"),
                                     ItemModel(image: "Кирпич",
                                               price: 124,
                                               description: "цукк"),
                                     ItemModel(image: "Мытье",
                                               price: 13,
                                               description: "цууирк"),
                                     ItemModel(image: "Плитка",
                                               price: 124,
                                               description: "цук"),
                                     ItemModel(image: "Плитка",
                                               price: 124,
                                               description: "wt314g")
                                     
                                     
                             ]),
                SectionModel(type: "Просмотренные",
                             title: "Недавно просмотренные",
                             items: [ItemModel(image: "Пескобетон",
                                               price: 136,
                                               description: "Пескобетон Axton 30 кг"),
                                     ItemModel(image: "Утеплитель",
                                               price: 525,
                                               description: "Утеплитель Роквул Стандарт 50 мм"),
                                     ItemModel(image: "Штукатурка",
                                               price: 352,
                                               description: "Штукатурка гипсовая Knauf Ротбанд 25 кг"),
                                     ItemModel(image: "Aqua",
                                               price: 261,
                                               description: "Штукатурка гипсовая Bergauf Aqua Putz 25 кг")]),
                SectionModel(type: "лучшая цена",
                             title: "Лучшая цена",
                             items: [ItemModel(image: "Минимойка",
                                               price: 7430,
                                               description: "Минимойка Sterwins 135, 135 бар, 420 л/ч, 2 кВт"),
                                     ItemModel(image: "Салфетка",
                                               price: 122,
                                               description: "Салфетка, 35x35 см, микрофибра, 4 шт."),
                                     ItemModel(image: "Стеклоочиститель",
                                               price: 3498,
                                               description: "Стеклоочиститель Bosch GlassVac Solo"),
                                     ItemModel(image: "Очиститель",
                                               price: 85,
                                               description: "Очиститель для стёкол Clean Glass 600 мл")
                             ])
]

var catalog = [SectionModel(type: "", title: "", items: [ItemModel(image: "Минимойка",
                                                                   price: 7430,
                                                                   description: "Минимойка Sterwins 135, 135 бар, 420 л/ч, 2 кВт"),
                                                         ItemModel(image: "Салфетка",
                                                                   price: 122,
                                                                   description: "Салфетка, 35x35 см, микрофибра, 4 шт."),
                                                         ItemModel(image: "Стеклоочиститель",
                                                                   price: 3498,
                                                                   description: "Стеклоочиститель Bosch GlassVac Solo"),
                                                         ItemModel(image: "Очиститель",
                                                                   price: 85,
                                                                   description: "Очиститель для стёкол Clean Glass 600 мл"),
                                                         ItemModel(image: "Пескобетон",
                                                                   price: 136,
                                                                   description: "Пескобетон Axton 30 кг"),
                                                         ItemModel(image: "Утеплитель",
                                                                   price: 525,
                                                                   description: "Утеплитель Роквул Стандарт 50 мм"),
                                                         ItemModel(image: "Штукатурка",
                                                                   price: 352,
                                                                   description: "Штукатурка гипсовая Knauf Ротбанд 25 кг"),
                                                         ItemModel(image: "Aqua",
                                                                   price: 261,
                                                                   description: "Штукатурка гипсовая Bergauf Aqua Putz 25 кг")
])]

