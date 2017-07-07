
// 資料結構與演算效率關聯範例，以builder.pentatonic.com為例

// 情境: 產品有多個選項，各選項有多個可選值，各可選值本身可設定數量，
// 當產品的全部選項皆有值時為1個完整bundle產品(各可選值數量1單位)，
// 不為bundle的可選值每1單位為1個simple產品

// 用selectedValuesNum遞減排序第1層arr之後，
// 第1層arr的最後一個元素的electedValuesNum就是bundle數量，
// #1接著對第1層的每1個元素的selectedSpecs以qty遞減排序，
// 然後第1層各元素的min([0~n].selectedSpecs[0].qty)，
// 得出同1批bundle request的qty，
// 在登入request form後對其qty--(--後為0則移除該元素)，
// 至此為完成1個最佳化bundle request，之後重複#1，
// 直到bundle request送完，剩下的以simple逐一送出即可


[
  {
    optionId: 123,
    selectedSpecs: [
      {
        SpecId:
        qty: 2
      },
      {
        SpecId:
        qty: 1
      }
    ],
    selectedValuesNum: 3
  },
  {
    optionId: 123,
    selectedSpecs: [
      {
        SpecId:
        qty: 2
      },
      {
        SpecId:
        qty: 2
      }
    ],
    selectedValuesNum: 4
  },
  {
    optionId: 123,
    selectedSpecs: [
      {
        SpecId:
        qty: 3
      },
      {
        SpecId:
        qty: 1
      }
    ],
    selectedValuesNum: 4
  }
]