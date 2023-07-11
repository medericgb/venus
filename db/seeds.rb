# create admin
super_admin = Accounts::Operations::Admin::CreateAccount.call(admin_params: { username: "mederic", email: "mederic@mail.com", password: "azerty" })

# create intervenants
int_1 = Accounts::Operations::Intervenant::CreateAccount.call(intervenant_params: { username: "int1", email: "int1@mail.com", password: "azerty" })
int_2 = Accounts::Operations::Intervenant::CreateAccount.call(intervenant_params: { username: "int2", email: "int2@mail.com", password: "azerty" })
int_3 = Accounts::Operations::Intervenant::CreateAccount.call(intervenant_params: { username: "int3", email: "int3@mail.com", password: "azerty" })

# create clients
client_1 = Accounts::Operations::Client::CreateAccount.call(client_params: { username: "client1", email: "client1@mail.com", password: "azerty" })
client_2 = Accounts::Operations::Client::CreateAccount.call(client_params: { username: "client2", email: "client2@mail.com", password: "azerty" })
client_3 = Accounts::Operations::Client::CreateAccount.call(client_params: { username: "client3", email: "client3@mail.com", password: "azerty" })
client_4 = Accounts::Operations::Client::CreateAccount.call(client_params: { username: "client4", email: "client4@mail.com", password: "azerty" })

# create tickets
ticket_1 = Tickets::Operations::CreateTicket.call(ticket_params: { title: "ticket1", content: "content1", client_id: client_4.id, intervenant_id: int_1.id })
ticket_2 = Tickets::Operations::CreateTicket.call(ticket_params: { title: "ticket2", content: "content2", client_id: client_2.id, intervenant_id: int_2.id })
ticket_3 = Tickets::Operations::CreateTicket.call(ticket_params: { title: "ticket3", content: "content3", client_id: client_3.id, intervenant_id: int_3.id })
ticket_4 = Tickets::Operations::CreateTicket.call(ticket_params: { title: "ticket4", content: "content4", client_id: client_1.id, intervenant_id: int_2.id })
ticket_5 = Tickets::Operations::CreateTicket.call(ticket_params: { title: "ticket5", content: "content5", client_id: client_2.id, intervenant_id: int_2.id })
ticket_6 = Tickets::Operations::CreateTicket.call(ticket_params: { title: "ticket6", content: "content6", client_id: client_3.id, intervenant_id: int_1.id })

ints = Accounts::Entities::Intervenant.all
