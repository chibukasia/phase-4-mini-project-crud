class SpicesController < ApplicationController
    wrap_parameters formart: []
    # GET /spices
    def index
        render json: Spice.all
    end

    # GET /spice
    # def show
    #     spice = Spice.find_by(id:params[:id])
        
    #     if spice
    #         render json: spice, status: :ok
    #     else
    #         render json: {error: "Spice not found"}, status: :not_found
    #     end
    # end

    # POST /spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    # UPDATE /spices
    def update
        spice = Spice.find_by(id:params[:id])

        if spice
            spice.update(spice_params)
            render json: spice, status: :accepted 
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    # DELETE /spices
    def destroy

        spice = Spice.find_by(id: params[:id])

        if spice
            spice.destroy
            head :no_content
        else
            render json: {error: "Spice not found"}, status: :not_found
        end
    end

    # Private methods
    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
