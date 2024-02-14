class ReviewsController < ApplicationController
    before_action :set_movie
    before_action :set_review, only: %i[ show edit update destroy ]
  
  
    def index
      @reviews = @movie.reviews
    end
  
    def show
    end
  
  
    def new
      @review = @movie.reviews.new
    end
  
  
    def edit
    end
  
  
    def create
      @review = @movie.reviews.build(review_params)
  
      respond_to do |format|
        if @review.save
          format.html { redirect_to movie_reviews_url, notice: "Review was successfully created." }
          format.json { render :show, status: :created, location: @review }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @review.update(review_params)
          format.html { redirect_to movie_reviews_url, notice: "Review was successfully updated." }
          format.json { render :show, status: :ok, location: @review }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @review.destroy
  
      respond_to do |format|
        format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
  
      def set_movie
        @movie = Movie.find(params[:movie_id])
      end
      def set_review
        @review = Review.find(params[:id])
      end
      def review_params
        params.require(:review).permit(:movie_id,:stars, :review,:user)
      end
  end
  