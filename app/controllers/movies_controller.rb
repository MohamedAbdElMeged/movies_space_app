class MoviesController < ApplicationController
    before_action :set_movie, only: %i[ show edit update destroy ]
  
    def index
      
      @q = Movie.includes(:reviews).ransack(params[:q])
      @movies = @q.result
    end
  
    def show
    end
  
  
    def new
      @movie = Movie.new
      @movie.movie_actors.build.build_actor
    end
  
  
    def edit
    end
  
  
    def create
      @movie = Movie.new(movie_params)
      puts params.inspect
      respond_to do |format|
        if @movie.save
          format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
          format.json { render :show, status: :created, location: @movie }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @movie.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @movie.update(movie_params)
          format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
          format.json { render :show, status: :ok, location: @movie }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @movie.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @movie.destroy
  
      respond_to do |format|
        format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
  
      def set_movie
        @movie = Movie.find(params[:id])
      end
  
      def movie_params
        params.require(:movie).permit(:name,:description,:year,:country,:filming_location,:director,movie_actors_attributes: [:id, :actor_id, { actor_attributes: [:id, :name] }, :_destroy])
      end
  end
  