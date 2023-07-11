class TicketsController < ApplicationController

  def index
    # @number_of_open_tickets = Ticket.where(status: 'open').count
    # @number_of_closed_tickets = Ticket.where(status: 'closed').count
    # @tickets_by_intervenant = Ticket.where(assigned_to: current_account.id).group(:status).count
  end 

  def new
    @ticket = Tickets::Entities::Ticket.new
  end

  def create
    context = Tickets::Operations::CreateTicket.call(ticket_params: create_ticket_params)
    if context.ticket.save
      redirect_to tickets_path, notice: "Ticket created successfully."
    else
      redirect_to new_ticket_path, alert: "Failed to create ticket."
    end
  end

  def show
    context = Tickets::Operations::GetById.call(ticket_id: params[:id])
    @ticket = context.ticket
  end

  def edit
  end

  def update
  end

  private
  def create_ticket_params
    params[:tickets_entities_ticket].merge(intervenant_id: intervenant_with_less_tickets.id, client_id: @current_user.id).permit!
  end

  def intervenant_with_less_tickets
    context = Accounts::Operations::Intervenant::GetIntervenantWithLessTickets.call
    context.intervenant
  end
end

