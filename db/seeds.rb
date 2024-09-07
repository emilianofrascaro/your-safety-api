# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

exams = ['Esame del sangue', 'Radiografia', 'Ecografia', 'TAC', 'Risonanza Magnetica']
exams.each { |exam_name| Exam.create(name: exam_name) unless Exam.exists?(name: exam_name) }

faqs = [
  { question: "Come posso prenotare un esame?", answer: "Puoi prenotare un esame accedendo alla sezione 'Le tue prenotazioni' e cliccando sul pulsante '+' in basso a destra." },
  { question: "Posso modificare una prenotazione esistente?", answer: "Sì, puoi modificare una prenotazione esistente accedendo ai dettagli della prenotazione e cliccando sul pulsante 'Modifica'." },
  { question: "Come posso cancellare una prenotazione?", answer: "Per cancellare una prenotazione, vai ai dettagli della prenotazione e clicca sul pulsante 'Cancella'." }
]

faqs.each do |faq|
  Faq.create!(faq) unless Faq.exists?(question: faq[:question])
end



UsefulLink.create([
  {
    name: "Sito ufficiale della città",
    url: "https://www.comune.example.it",
    description: "Informazioni e servizi offerti dal comune"
  },
  {
    name: "Protezione Civile",
    url: "https://www.protezionecivile.gov.it",
    description: "Sito ufficiale della Protezione Civile italiana"
  }
])

# Se vuoi aggiungere loghi, dovrai farlo in modo asincrono:
UsefulLink.find_by(name: "Sito ufficiale della città").logo.attach(io: File.open(Rails.root.join('public/images/logo.png')), filename: 'logo.png')
