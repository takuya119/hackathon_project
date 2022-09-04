require 'nokogiri'
require 'open-uri'
require 'csv'

class GetRoomData
  def create_room_csv
    infos = [["id", "name", "description", "capacity", "public_facility_id"]]
    id = 1

    cul_pfs = PublicFacility.where(category: "文化センター")
    room_list = []
    cul_pfs.each do |pf|
      tmp_array = create_cul_room_list(pf.id, pf.reserve_url)
      room_list.concat(tmp_array)
    end

    spo_pfs = PublicFacility.where(category: "スポーツセンター").limit(6)
    spo_pfs.each do |pf|
      tmp_array = create_spo_room_list(pf.id, pf.reserve_url)
      room_list.concat(tmp_array)
    end

    shukai_list = create_shukai_list
    room_list.concat(shukai_list)

    room_list.each do |room|
      infos << [id, room[:name], room[:description], room[:capacity], room[:public_facility_id]]
      id += 1
    end

    CSV.open("room.csv", "wb") do |csv|
      infos.each do |info|
        csv << info
      end
    end
  end

  private

  def create_cul_room_list(id, url)
    base_url = "#{url}shisetsu/ichiran"
    base_url = "#{url}shisetsu-bunka/ichiran" if url.include?("kameido")

    file = URI.open(base_url)
    doc = Nokogiri::HTML.parse(file)

    room_data_list = doc.css("table tr").map do |table|
      name = table.css("td a b")&.map{|ele| ele.text}[0]
      capacity = table.css("td:contains('人')")&.map{|ele| ele.text}[0]&.delete("人")
      next if name.nil? && capacity.nil?
      description = "仮"
      data_hash = { name: , capacity: , description: , public_facility_id: id }
    end

    room_data_list.compact
  end

  def create_spo_room_list(id, url)
    base_url = "#{url}introduction"
    file = URI.open(base_url)
    doc = Nokogiri::HTML.parse(file)

    spo_data_list = doc.css("div.edit a").map do |a|
      name = a.text
      data_hash = { name: , capacity: nil, description: "仮", public_facility_id: id }
    end

    spo_data_list
  end

  def create_shukai_list
    base_url = "https://www.city.koto.lg.jp/101010/kurashi/komyunitei/chiiki/shukai/7685.html"

    file = URI.open(base_url)
    doc = Nokogiri::HTML.parse(file)

    tmp_name = ""
    data_list = doc.css("table.datatable tr").map do |tr|
      data_array = tr.css("td").map{|td| td.text}.reject{|ele| ele.include?("\r")}
      next if data_array.length == 0 || data_array[0].include?("25")
      tmp_name = data_array.shift if !data_array[0]&.include?("室")
      data_hash = {name: data_array[0], capacity: data_array[1], pf: tmp_name}
    end

    facs = PublicFacility.where(category: "地区集会所")

    shukai_data_list = data_list.compact.map do |room|
      fac = facs.find_by(name: room[:pf] + "地区集会所")
      room[:public_facility_id] = fac.id
      room[:description] = "仮"
      room
    end

    shukai_data_list
  end
end
