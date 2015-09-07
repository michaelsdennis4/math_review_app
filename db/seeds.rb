# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Teacher.destroy_all


Teacher.create({
	first_name: 'Michael',
	last_name: 'Dennis',
	email: 'michaelsdennis4@gmail.com',
	password: 'juliank',
	password_confirmation: 'juliank',
}) 

Teacher.create({
	first_name: 'Michele',
	last_name: 'Dennis',
	email: 'michele.dennis@mastersny.org',
	password: 'pass',
	password_confirmation: 'pass',
})

Student.destroy_all

Student.create({
	first_name: 'Julian',
	last_name: 'Dennis',
	email: 'julian.dennis@mastersny.org',
	password: 'pass',
	password_confirmation: 'pass',
	grad_year: 2021
})

Student.create({
	first_name: 'Miranda',
	last_name: 'Dennis',
	email: 'miranda.dennis@mastersny.org',
	password: 'pass',
	password_confirmation: 'pass',
	grad_year: 2023
})