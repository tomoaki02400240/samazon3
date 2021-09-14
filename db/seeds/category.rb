major_category_names = ["本", "コンピュータ", "ディスプレイ"]
book_categories = ["ビジネス", "文学・評論", "人文・思想", "スポーツ",
                    "コンピュータ・IT", "資格・検定・就職", "絵本・児童書", "写真集",
                    "ゲーム攻略本", "雑誌", "アート・デザイン", "ノンフィクション"]
computer_categories = ["ノートPC", "デスクトップPC", "タブレット"]
display_categories = ["19~20インチ", "デスクトップPC", "タブレット"]

major_category_names.each do |major_category_name|

  if major_category_name == "本"
    book_categories.each do |book|
      Category.create(
        major_category_name: major_category_name,
        name: book,
        description: book
      )
    end
  elsif major_category_name == "コンピュータ"
    computer_categories.each do |computer|
      Category.create(
        major_category_name: major_category_name,
        name: computer,
        description: computer
      )
    end
  elsif major_category_name == "ディスプレイ"
    display_categories.each do | display|
      Category.create(
        major_category_name: major_category_name,
        name: display,
        description: display
      )
    end
  end
end