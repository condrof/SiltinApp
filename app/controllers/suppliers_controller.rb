class SuppliersController < ApplicationController

  def show
    @supplier = Supplier.find(params[:id])
    authorize! :read,  @supplier
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
      authorize! :manage,  @supplier
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params[:supplier].permit(:name, :email, :phone, :address, :description)
    end

end
