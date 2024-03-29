# encoding: utf-8
class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.json

  before_filter :authenticate_user!, :except => [:new, :create]

  def index
    @contacts = Contact.all

    authorize! :read, Contact

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
    end


  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    @contact = Contact.find(params[:id])

    authorize! :read, @contact
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
    
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])

    authorize! :update, @contact
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to :root, notice: 'Sua mensagem foi enviada com sucesso' }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    @contact = Contact.find(params[:id])

    authorize! :update, @contact

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to @contact, notice: 'Messagem alterada com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    
    authorize! :manage, @contact

    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end
end
