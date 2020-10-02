# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: "a@a", password: "aaaaaa")

Genre.create!([{name: "体験談"}, {name: "相談"}])

internal_medicine = Department.create(name: "内科")
internal_medicine_department = internal_medicine.children.create([
  {name: "消化器内科"}, {name: "循環器内科"}, {name: "呼吸器内科"},
  {name: "腎臓内科"}, {name: "内分泌内科"}, {name: "糖尿病内科"},
  {name: "リウマチ科"}, {name: "血液内科"}, {name: "神経内科"}
 ])
surgery = Department.create(name: "外科")
surgery_department = surgery.children.create([
  {name: "消化器外科"}, {name: "呼吸器外科"}, {name: "心臓血管外科"},
  {name: "乳腺外科"}, {name: "小児外科"}
])
orthopedic_surgery = Department.create(name: "整形外科")
plastic_surgery = Department.create(name: "形成外科")
neurosurgery = Department.create(name: "脳神経外科")
pediatrics = Department.create(name: "小児科")
obstetrics_and_gynecology = Department.create(name: "産婦人科")
dermatology = Department.create(name: "皮膚科")
urology = Department.create(name: "泌尿器科")
ophthalmology = Department.create(name: "眼科")
otolaryngology = Department.create(name: "耳鼻咽喉科")
dentistry = Department.create(name: "歯科")