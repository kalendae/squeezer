class DeviationsController < ApplicationController
  # GET /deviations
  # GET /deviations.xml
  def index
    @deviations = Deviation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deviations }
    end
  end

  # GET /deviations/1
  # GET /deviations/1.xml
  def show
    @deviation = Deviation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deviation }
    end
  end

  # GET /deviations/new
  # GET /deviations/new.xml
  def new
    @deviation = Deviation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deviation }
    end
  end

  # GET /deviations/1/edit
  def edit
    @deviation = Deviation.find(params[:id])
  end

  # POST /deviations
  # POST /deviations.xml
  def create
    @deviation = Deviation.new(params[:deviation])

    respond_to do |format|
      if @deviation.save
        flash[:notice] = 'Deviation was successfully created.'
        format.html { redirect_to(@deviation) }
        format.xml  { render :xml => @deviation, :status => :created, :location => @deviation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deviation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /deviations/1
  # PUT /deviations/1.xml
  def update
    @deviation = Deviation.find(params[:id])

    respond_to do |format|
      if @deviation.update_attributes(params[:deviation])
        flash[:notice] = 'Deviation was successfully updated.'
        format.html { redirect_to(@deviation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @deviation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /deviations/1
  # DELETE /deviations/1.xml
  def destroy
    @deviation = Deviation.find(params[:id])
    @deviation.destroy

    respond_to do |format|
      format.html { redirect_to(deviations_url) }
      format.xml  { head :ok }
    end
  end
end
