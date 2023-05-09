function calendar () {
  // 週
  const weekCalendar = document.getElementById('week_calendar');
  const weekCalendarButton = document.getElementById('week_calendar_btn');
  // 月
  const monthCalendar = document.getElementById('month_calendar');
  const monthCalendarButton = document.getElementById('month_calendar_btn');

  // カレンダーの表示状態を取得する
  const currentView = localStorage.getItem('calendarView');
  let defaultCalendar = localStorage.getItem('defaultCalendar') || 'month';

  // カレンダーの表示状態を復元する
  if (currentView === 'week') {
    monthCalendar.style.display = 'none';
    weekCalendar.style.display = 'block';
  } else {
    weekCalendar.style.display = 'none';
    monthCalendar.style.display = 'block';
  }

  monthCalendarButton.addEventListener("click", () => {
    monthCalendar.style.display = "none";
    weekCalendar.style.display = "block";

    // カレンダーの表示状態を保存する
  
    localStorage.setItem('defaultCalendar', 'week');
  });

  weekCalendarButton.addEventListener("click", () => {
    weekCalendar.style.display = "none";
    monthCalendar.style.display = "block";

    // カレンダーの表示状態を保存する
    localStorage.setItem('defaultCalendar', 'month');
  });
};

window.addEventListener('load', calendar);