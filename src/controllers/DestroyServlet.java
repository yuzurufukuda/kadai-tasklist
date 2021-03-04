package controllers;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.tasks;
import utils.DBUtil;
/**
 * Servlet implementation class DestroyServlet
 */
@WebServlet("/destroy")
public class DestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DestroyServlet() {
        super();
    }
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())){
            EntityManager em = DBUtil.createEntityManager();

            // セッションスコープからタスクのIDを取得して
            // 該当のIDのメッセージを1件のみをデータベースから取得
            tasks t = em.find(tasks.class, (Integer)(request.getSession().getAttribute("task_id")));

            em.getTransaction().begin();
            em.remove(t);
            em.getTransaction().commit();
            request.getSession().setAttribute("flush", "登録が完了しました。");
            em.close();

            // セッションスコープ上の不要になったデータ削除
            request.getSession().removeAttribute("task_id");

            // indexページにリダイレクト
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }

}
