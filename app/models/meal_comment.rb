class MealComment < ApplicationRecord
  belongs_to :end_user
  belongs_to :post_meal

  has_one :notification, as: :subject, dependent: :destroy
  # :as => :subjectの部分はこのモデルがポリモーフィック関連付けの一部であることを示している

  validates :comment, presence: true

  after_create_commit :create_notifications
  # after_create_commitコールバック（コメントが作成され変更がDBにコミットされると呼び出される）

  private
  # 新しい通知を作成
  def create_notifications
    Notification.create(subject: self, end_user: post_meal.end_user, action_type: :commented_to_meal_post)
    # selfは現在のオブジェクトを指す(ポリモーフィック関連付けを使用しているので、subjectは異なるモデルを参照できる)
  end
end
