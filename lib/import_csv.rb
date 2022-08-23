require "csv"

class ImportCsv
  def self.execute(model:, file_name: nil)
    # モデル名に対応するクラス名を作成
    model_name = model.to_s.classify
    # モデルのテーブル名に対応するクラス名
    table_name = model_name.tableize
    # テーブル名を単数形に変換(file_nameがnilなら)
    file_name ||= table_name.singularize

    # 上の3行の処理で与えられたモデル名から対応するファイル名(用意したファイル名)を作成してpathを作成
    path = Rails.root.join("db/csv_data/#{file_name}.csv")

    list = []
    # pathで指定したCSVファイルから1行ずつ読み取る
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end

    # 与えられたモデルに CSVデータを投入
    # activerecord-importのメソッドを使ってDBに一括でレコードを作成
    model_name.constantize.import!(list, on_duplicate_key_update: :all)
    # 次に振る id を正常化
    ActiveRecord::Base.connection.execute("select setval('#{table_name}_id_seq',(select max(id) from #{table_name}))")
  end
end
