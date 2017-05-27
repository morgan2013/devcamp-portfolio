class PortfoliosController < ApplicationController
  layout "portfolio"

  def index
    @portfolio_items = Portfolio.order('position ASC')
  end

  def angular
    @portfolio_items = Portfolio.angular
  end

  def new
    @portfolio = Portfolio.new
    3.times { @portfolio.technologies.build }
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id]);
    @portfolio.destroy
    respond_to do |format|
      format.html{ redirect_to portfolios_path, notice: 'Portfolio was removed'}
      format.json{ head :no_content }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
  end
end
