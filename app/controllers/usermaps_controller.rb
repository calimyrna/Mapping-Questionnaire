class UsermapsController < ApplicationController
  radiant_layout 'Sketchbook'

  # GET /usermaps
  # GET /usermaps.xml
  def index
    @usermaps = Usermap.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usermaps }
    end
  end

  # GET /usermaps/1
  # GET /usermaps/1.xml
  def show
    @usermap = Usermap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @usermap }
    end
  end

  # GET /usermaps/new
  # GET /usermaps/new.xml
  def new
    @usermap = Usermap.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @usermap }
    end
  end

  # GET /usermaps/1/edit
  def edit
    @usermap = Usermap.find(params[:id])
  end

  # POST /usermaps
  # POST /usermaps.xml
  def create
    @usermap = Usermap.new(params[:usermap])

    respond_to do |format|
      if @usermap.save
        flash[:notice] = 'Usermap was successfully created.'
        format.html { redirect_to(@usermap) }
        format.xml  { render :xml => @usermap, :status => :created, :location => @usermap }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usermap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /usermaps/1
  # PUT /usermaps/1.xml
  def update
    @usermap = Usermap.find(params[:id])

    respond_to do |format|
      if @usermap.update_attributes(params[:usermap])
        flash[:notice] = 'Usermap was successfully updated.'
        format.html { redirect_to(@usermap) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usermap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usermaps/1
  # DELETE /usermaps/1.xml
  def destroy
    @usermap = Usermap.find(params[:id])
    @usermap.destroy

    respond_to do |format|
      format.html { redirect_to(usermaps_url) }
      format.xml  { head :ok }
    end
  end
end
