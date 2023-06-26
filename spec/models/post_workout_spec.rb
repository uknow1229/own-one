require "rails_helper"

RSpec.describe PostWorkout, type: :model do
  # Factoryでデータを作る
  let(:end_user) { create(:end_user) }
  let(:post_workout) { build(:post_workout) }

  describe "テスト用のUserやPostが存在するか" do
    it "UserとPostが有効であること" do
      expect(end_user).to be_valid
      expect(post_workout).to be_valid
    end
  end

  describe "モデルのテスト" do
    it "有効な投稿内容の場合は保存されること" do
      expect(FactoryBot.build(:post_workout)).to be_valid
    end
  end

  describe "日時のバリデーション" do
    it "空欄であればエラーメッセージが返ること" do
      post_workout.start_time = nil
      post_workout.valid?
      expect(post_workout.errors[:start_time]).to include("を入力してください")
    end
  end

  describe "時間のバリデーション" do
    it "空欄であればエラーメッセージが返ること" do
      post_workout.time = nil
      post_workout.valid?
      expect(post_workout.errors[:time]).to include("を入力してください")
    end
  end

  describe "タイトルのバリデーション" do
    it "空欄であればエラーメッセージが返ること" do
      post_workout.title = nil
      post_workout.valid?
      expect(post_workout.errors[:title]).to include("を入力してください")
    end
    it "40文字以内であること: 40文字は◯" do
      post_workout.title = Faker::Lorem.characters(number: 40)
      expect(post_workout).to be_valid
    end
    it "40文字以内であること: 41文字は×" do
      post_workout.title = Faker::Lorem.characters(number: 41)
      post_workout.valid?
      expect(post_workout.errors[:title]).to include("は40文字以内で入力してください")
    end
  end

  describe "メモのバリデーション" do
    it "空欄であればエラーメッセージが返ること" do
      post_workout.memo = nil
      post_workout.valid?
      expect(post_workout.errors[:memo]).to include("を入力してください")
    end
    it "800文字以内であること: 800文字は◯" do
      post_workout.memo = Faker::Lorem.characters(number: 800)
      expect(post_workout).to be_valid
    end
    it "800文字以内であること: 801文字は×" do
      post_workout.memo = Faker::Lorem.characters(number: 801)
      post_workout.valid?
      expect(post_workout.errors[:memo]).to include("は800文字以内で入力してください")
    end
  end

  describe "アソシエーション" do
    it "PostWorkoutはEndUserに所属すること (belongs_to test)" do
      association = PostWorkout.reflect_on_association(:end_user)
      expect(association.macro).to eq(:belongs_to)
    end

    it "PostWorkoutはPostCommentを複数持つこと (has_many test)" do
      association = PostWorkout.reflect_on_association(:workout_comments)
      expect(association.macro).to eq(:has_many)
    end

    it "PostWorkoutはPostLikeを複数持つこと (has_many test)" do
      association = PostWorkout.reflect_on_association(:workout_likes)
      expect(association.macro).to eq(:has_many)
    end
  end
end
