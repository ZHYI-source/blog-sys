/**
 *@author ZY
 *@date 2022/5/16
 *@Description:交互弹窗
 */
const Toast = {}
// info,success,error 内容为7个字，其他的不限
Toast.info = (title, duration) => {
    uni.showToast({
        title: title || '提示',
        icon: 'none',
        duration: duration || 1500
    });
}
Toast.success = (title, duration) => {
    uni.showToast({
        title: title || '成功',
        icon: 'success',
        duration: duration || 1500
    });
}
Toast.error = (title, duration) => {
    uni.showToast({
        title: title || '失败',
        icon: 'error',
        duration: duration || 1500
    });
}
Toast.fail = (title, duration) => {
    uni.showToast({
        title: title || '失败',
        icon: 'fail',
        duration: duration || 1500
    });
}
Toast.exception = (title, duration) => {
    uni.showToast({
        title: title || '失败',
        icon: 'exception',
        duration: duration || 1500
    });
}
Toast.loading = (title, mask = false) => {
    uni.showLoading({
        title: '加载中',
        mask: mask
    });
}
Toast.hideLoading = () => {
    uni.hideLoading();
}
//模态弹窗
Toast.showModal = (content, cb, title = '提示', showCancel, cancelText = '取消', confirmText = '确认') => {
    uni.showModal({
        title: title,
        content: content,
        showCancel,
        cancelText,
        confirmText,
        success: function (res) {
            if (res.confirm) {
                cb(true)
            } else if (res.cancel) {
                cb(false)
            }
        }
    });
}
export default Toast
